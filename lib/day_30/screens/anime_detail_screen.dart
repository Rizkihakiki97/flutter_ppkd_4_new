import 'dart:ui';

import 'package:flutter/material.dart';
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
        title: Text(title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // 🔹 Background sesuai gambar anime
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: Colors.black),
            ),
          ),
          // 🔹 Efek blur background
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(color: Colors.black.withOpacity(0.4)),
            ),
          ),

          // 🔹 Konten utama
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 100, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Poster anime
                  Hero(
                    tag: title,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        imageUrl,
                        width: 250,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tombol Play
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow, color: Colors.white),
                    label: const Text(
                      "Play",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 10,
                      shadowColor: Colors.redAccent.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Detail info box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white30, width: 1),
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
                  const SizedBox(height: 30),

                  // Synopsis section
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Synopsis",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    synopsis,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      height: 1.5,
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
