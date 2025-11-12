import 'dart:convert';
import 'package:flutter_ppkd_4_new/day_30/models/jikan_models.dart';
import 'package:http/http.dart' as http;

// Fungsi untuk fetch data anime dari Jikan API
Future<List<Datum>> fetchAnime() async {
  try {
    final response = await http.get(
      Uri.parse("https://api.jikan.moe/v4/anime"),
    );

    // Cek status response
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Pastikan key "data" ada dan berupa List
      if (jsonResponse["data"] != null && jsonResponse["data"] is List) {
        final List<dynamic> animeJson = jsonResponse["data"];

        // Ubah ke List<Datum>
        return animeJson
            .map((json) => Datum.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception("Data tidak ditemukan di response");
      }
    } else {
      throw Exception("Gagal memuat data: ${response.statusCode}");
    }
  } catch (e) {
    print("Error saat fetch data: $e");
    throw Exception("Terjadi kesalahan saat mengambil data: $e");
  }
}
