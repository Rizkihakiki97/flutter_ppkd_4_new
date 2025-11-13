import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_30/models/jikan_models.dart';
import 'package:flutter_ppkd_4_new/day_30/screens/anime_detail_screen.dart';
import 'package:flutter_ppkd_4_new/day_30/services/api_jikan.dart';

class JikanScreen extends StatefulWidget {
  const JikanScreen({super.key});

  @override
  State<JikanScreen> createState() => _JikanScreenState();
}

class _JikanScreenState extends State<JikanScreen>
    with SingleTickerProviderStateMixin {
  late Future<List<Datum>> futureAnime;
  List<Datum> _animeList = [];
  List<Datum> _filteredAnime = [];
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    futureAnime = fetchAnime();
    _loadAnime();

    // Animasi untuk judul AppBar
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _fadeAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(_animationController);

    _searchController.addListener(_filterAnime);
  }

  Future<void> _loadAnime() async {
    final animeData = await fetchAnime();
    setState(() {
      _animeList = animeData;
      _filteredAnime = animeData;
    });
  }

  void _filterAnime() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredAnime = _animeList
          .where((anime) => anime.title!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: FadeTransition(
          opacity: _fadeAnimation,
          child: const Text(
            "Anime List",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // 🔹 Background utama dengan blur + fallback jika gagal load
          Positioned.fill(
            child: Image.network(
              "https://images8.alphacoders.com/131/1319872.jpg",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.black87],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),

          // 🔹 Konten utama
          Column(
            children: [
              // 🔍 Search bar
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Cari anime...',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    prefixIcon: const Icon(Icons.search, color: Colors.white70),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: _loadAnime,
                  backgroundColor: Colors.deepPurple,
                  color: Colors.white,
                  child: FutureBuilder<List<Datum>>(
                    future: futureAnime,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      }

                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Error: ${snapshot.error}",
                            style: const TextStyle(color: Colors.redAccent),
                          ),
                        );
                      }

                      if (_filteredAnime.isEmpty) {
                        return const Center(
                          child: Text(
                            "Tidak ada anime ditemukan.",
                            style: TextStyle(color: Colors.white70),
                          ),
                        );
                      }

                      return ListView.builder(
                        padding: const EdgeInsets.only(bottom: 16),
                        itemCount: _filteredAnime.length,
                        itemBuilder: (context, index) {
                          final anime = _filteredAnime[index];
                          final imageUrl =
                              anime.images?["jpg"]?.imageUrl ??
                              "https://via.placeholder.com/150x200.png?text=No+Image";
                          final title = anime.title ?? "No Title";
                          final score = anime.score?.toString() ?? "-";
                          final type = anime.type ?? "Unknown";

                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionDuration: const Duration(
                                    milliseconds: 400,
                                  ),
                                  pageBuilder: (_, __, ___) =>
                                      AnimeDetailScreen(anime: anime),
                                  transitionsBuilder:
                                      (_, animation, __, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Gambar anime
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                    ),
                                    child: Image.network(
                                      imageUrl,
                                      width: 100,
                                      height: 130,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(
                                                width: 100,
                                                height: 130,
                                                color: Colors.grey.shade300,
                                                child: const Icon(
                                                  Icons.broken_image,
                                                  size: 40,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                    ),
                                  ),
                                  // Info anime
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            title,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            "🎬 $type",
                                            style: const TextStyle(
                                              color: Colors.white70,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "⭐ Score: $score",
                                            style: const TextStyle(
                                              color: Colors.amberAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
