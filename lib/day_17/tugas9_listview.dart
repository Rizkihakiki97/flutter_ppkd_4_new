import 'package:flutter/material.dart';

class Tugas9List17Day extends StatefulWidget {
  const Tugas9List17Day({super.key});

  @override
  State<Tugas9List17Day> createState() => _Tugas9List17DayState();
}

class _Tugas9List17DayState extends State<Tugas9List17Day> {
  final List<String> namaKategori17Day = [
    "Buah-Buahan",
    "Sayuran",
    "Elektronik",
    "Pakaian Pria",
    "Pakaian Wanita",
    "Alat Tulis Kantor",
    "Buku & Majalah",
    "Peralatan Dapur",
    "Makanan Ringan",
    "Minuman",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kategori'),
        // backgroundColor: Color(0xff80A1BA),
      ),
      body: ListView.builder(
        itemCount: namaKategori17Day.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(namaKategori17Day[index]));
        },
      ),
    );
  }
}
