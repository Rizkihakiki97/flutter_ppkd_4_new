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

class _JikanScreenState extends State<JikanScreen> {
  late Future<List<Datum>> futureAnime;
  List<Datum> allAnime = [];
  List<Datum> filteredAnime = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureAnime = fetchAnime();
  }

  /// 🔄 Fungsi untuk refresh data
  Future<void> _refreshData() async {
    setState(() {
      futureAnime = fetchAnime();
    });
  }

  /// 🔍 Filter anime berdasarkan keyword
  void _filterAnime(String query) {
    final filtered = allAnime
        .where(
          (anime) =>
              anime.title?.toLowerCase().contains(query.toLowerCase()) ?? false,
        )
        .toList();
    setState(() {
      filteredAnime = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple.shade900,
      appBar: AppBar(
        title: const Text("Anime List", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff57564F),
      ),
      body: Stack(
        children: [
          // 🔹 Background utama
          Positioned.fill(
            child: Image.network(
              "https://wallpaperaccess.com/full/1819121.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),

          // 🔹 Konten utama
          FutureBuilder<List<Datum>>(
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

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                    "Tidak ada data anime ditemukan.",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              allAnime = snapshot.data!;
              filteredAnime = _searchController.text.isEmpty
                  ? allAnime
                  : filteredAnime;

              return RefreshIndicator(
                onRefresh: _refreshData,
                color: Colors.white,
                backgroundColor: Colors.deepPurple,
                child: ListView(
                  children: [
                    // 🔹 Halaman Depan (Hero Section)
                    Container(
                      height: 220,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            "https://images7.alphacoders.com/130/1305953.jpeg",
                            fit: BoxFit.cover,
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Welcome to Jikan Anime 🎬",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Temukan anime terbaik untukmu!",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 🔹 Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: _filterAnime,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Cari anime...",
                          hintStyle: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white70,
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // 🔹 List Anime
                    ...filteredAnime.map((anime) {
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
                              transitionsBuilder: (_, animation, __, child) =>
                                  FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
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
                                  errorBuilder: (context, error, stackTrace) =>
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
                    }),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
