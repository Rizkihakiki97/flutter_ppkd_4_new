import 'dart:ui';
import 'package:flutter/material.dart';
// Asumsikan path dan model ini sudah ada
import 'package:flutter_ppkd_4_new/day_30/models/jikan_models.dart';

class AnimeDetailScreen extends StatelessWidget {
  final Datum anime;

  const AnimeDetailScreen({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        anime.images?["jpg"]?.imageUrl ??
        "https://via.placeholder.com/300x400.png?text=No+Image";

    final title = anime.title ?? "No Title";
    final synopsis = anime.synopsis ?? "No synopsis available.";
    final score = anime.score?.toString() ?? "-";
    final type = anime.type ?? "Unknown";
    final episodes = anime.episodes?.toString() ?? "-";
    final status = anime.status ?? "Unknown";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // 🔹 GAMBAR ANIME SEBAGAI BACKGROUND BLUR UTAMA
          Positioned.fill(
            child: Image.network(
              imageUrl, // Menggunakan gambar anime sebagai background
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: Colors.black), // Fallback jika gambar gagal
            ),
          ),
          // 🔹 Efek blur pada background gambar anime
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 25,
                sigmaY: 25,
              ), // Nilai blur yang lebih tinggi untuk background
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ), // Overlay gelap agar teks lebih mudah dibaca
            ),
          ),

          // 🔹 Konten utama (gambar poster, judul, detail, sinopsis)
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 80, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar poster anime di tengah (TANPA BLUR di sini, karena sudah jadi background)
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        imageUrl, // Tampilkan gambar asli di tengah
                        width: 250,
                        height: 350,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.broken_image,
                              size: 100,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Judul anime
                  Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Detail singkat (Type, Score, Episodes, Status)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "🎬 Type: $type",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "⭐ Score: $score",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "📺 Episodes: $episodes",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "📡 Status: $status",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sinopsis
                  const Text(
                    "Synopsis",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    synopsis,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
