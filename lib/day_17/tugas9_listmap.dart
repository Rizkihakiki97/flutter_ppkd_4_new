import 'package:flutter/material.dart';

class Tugas9ListmapDay17 extends StatefulWidget {
  const Tugas9ListmapDay17({super.key});

  @override
  State<Tugas9ListmapDay17> createState() => _Tugas9ListmapDay17State();
}

class _Tugas9ListmapDay17State extends State<Tugas9ListmapDay17> {
  final List<Map<String, dynamic>> namaKategori17Day = [
    {
      "name": "Buah-Buahan",
      "price": 15000,
      "condition": "Segar",
      "image": "assets/image/mangga1.png",
    },
    {
      "name": "Sayuran",
      "price": 12000,
      "condition": "Segar",
      "image": "assets/image/sayuran2.jpg",
    },
    {
      "name": "Elektronik",
      "price": 2500000,
      "condition": "Baru",
      "image": "assets/image/elektronik_laptop3.jpg",
    },
    {
      "name": "Pakaian Pria",
      "price": 10000,
      "condition": "Baru",
      "image": "assets/image/baju_pria.jpg",
    },
    {
      "name": "Pakaian Wanita",
      "price": 15000,
      "condition": "Baru",
      "image": "assets/image/baju_wanita.png",
    },
    {
      "name": "Alat Tulis Kantor",
      "price": 70000,
      "condition": "Baru",
      "image": "assets/image/alatkantor.jpg",
    },
    {
      "name": "Buku & Majalah",
      "price": 5000,
      "condition": "Baru",
      "image": "assets/image/buku.jpg",
    },
    {
      "name": "Peralatan Dapur",
      "price": 20000,
      "condition": "Baru",
      "image": "assets/image/dapur.png",
    },
    {
      "name": "Makanan Ringan",
      "price": 3000,
      "condition": "Baru",
      "image": "assets/image/ringan.jpg",
    },
    {
      "name": "Minuman",
      "price": 8000,
      "condition": "Baru",
      "image": "assets/image/jeruk.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori Two'),
        // backgroundColor: Color(0xff5682B1),
      ),
      body: ListView.builder(
        itemCount: namaKategori17Day.length,
        itemBuilder: (BuildContext context, int index) {
          final kategori = namaKategori17Day[index];
          return ListTile(
            leading: Image.asset(
              kategori['image'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(kategori['name']),
            subtitle: Text(
              'Harga: Rp ${kategori['price']} - Kondisi: ${kategori['condition']}',
            ),
          );
        },
      ),
    );
  }
}
