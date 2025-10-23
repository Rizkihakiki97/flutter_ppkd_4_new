import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_17/models/model.dart';

class Tugas9ListviewModelDay17 extends StatefulWidget {
  const Tugas9ListviewModelDay17({super.key});

  @override
  State<Tugas9ListviewModelDay17> createState() =>
      _Tugas9ListviewModelDay17State();
}

class _Tugas9ListviewModelDay17State extends State<Tugas9ListviewModelDay17> {
  final List<MinumanModel> namaKategori17Day = [
    MinumanModel(
      name: "Pop Ice Bude",
      price: 15000,
      image: "assets/image/popice.jpg",
    ),
    MinumanModel(
      name: "Jus Mangga",
      price: 12000,
      image: "assets/image/jusmangga.jpg",
    ),
    MinumanModel(
      name: "Kopi Hitam",
      price: 25000,
      image: "assets/image/kopi.jpg",
    ),
    MinumanModel(
      name: "Air Mineral",
      price: 8000,
      image: "assets/image/aqua.jpg",
    ),
    MinumanModel(
      name: "Susu Coklat",
      price: 20000,
      image: "assets/image/susucoklat.jpg",
    ),
    MinumanModel(
      name: "Es Americano",
      price: 30000,
      image: "assets/image/esamericano.jpg",
    ),
    MinumanModel(
      name: "Kopi Latte",
      price: 28000,
      image: "assets/image/latte.jpg",
    ),
    MinumanModel(
      name: "Jus Alpukat",
      price: 18000,
      image: "assets/image/latte.jpg",
    ),
    MinumanModel(
      name: "Cappucino",
      price: 26000,
      image: "assets/image/cappucino.jpg",
    ),
    MinumanModel(
      name: "Espresso",
      price: 28000,
      image: "assets/image/Espresso.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori Minuman'),
        // backgroundColor: Color(0xff748DAE),
      ),
      body: ListView.builder(
        itemCount: namaKategori17Day.length,
        itemBuilder: (BuildContext context, int index) {
          final kategori = namaKategori17Day[index];
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                // color: kategori.backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(kategori.image),
            ),
            title: Text(kategori.name),
            subtitle: Text('item.description'),
          );
        },
      ),
    );
  }
}
