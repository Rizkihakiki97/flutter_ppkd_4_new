<<<<<<< HEAD
import 'package:flutter/material.dart';

class Tugas7Dropdown extends StatefulWidget {
  const Tugas7Dropdown({super.key});

  @override
  State<Tugas7Dropdown> createState() => _Tugas7DropdownState();
}

class _Tugas7DropdownState extends State<Tugas7Dropdown> {
  String? selectedCategory;
  final List<String> categories = [
    'Elektronik',
    'Pakaian',
    'Makanan',
    'Lainnya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dropdown Menu 
            DropdownButton<String>(
              hint: const Text("Pilih kategori produk"),

              value: selectedCategory,
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
            ),

            const SizedBox(height: 20),

            Text(
              selectedCategory == null
                  ? "Belum ada kategori yang dipilih"
                  : "Anda memilih kategori: $selectedCategory",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';

class Tugas7Dropdown extends StatefulWidget {
  const Tugas7Dropdown({super.key});

  @override
  State<Tugas7Dropdown> createState() => _Tugas7DropdownState();
}

class _Tugas7DropdownState extends State<Tugas7Dropdown> {
  String? selectedCategory;
  final List<String> categories = [
    'Elektronik',
    'Pakaian',
    'Makanan',
    'Lainnya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dropdown Menu 
            DropdownButton<String>(
              hint: const Text("Pilih kategori produk"),

              value: selectedCategory,
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
            ),

            const SizedBox(height: 20),

            Text(
              selectedCategory == null
                  ? "Belum ada kategori yang dipilih"
                  : "Anda memilih kategori: $selectedCategory",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
>>>>>>> 81e46b4cc88fed7d181152f063dc23239c4bc4e8
