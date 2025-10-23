import 'package:flutter/material.dart';

class Tugas7Switch extends StatefulWidget {
  const Tugas7Switch({super.key});

  @override
  State<Tugas7Switch> createState() => _Tugas7SwitchState();
}

class _Tugas7SwitchState extends State<Tugas7Switch> {
  bool isDarkMode = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text("SYSTEM App"),
        backgroundColor: isDarkMode ? Colors.blueGrey[900] : Color(0xffB7B89F),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTile(
              title: const Text("Aktifkan Mode Gelap"),
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
              tileColor: Colors.white,
              activeTrackColor: const Color.fromARGB(255, 18, 98, 218),
              inactiveThumbColor: const Color.fromARGB(255, 233, 2, 2),
              inactiveTrackColor: const Color.fromARGB(255, 253, 253, 253),
            ),
            const SizedBox(height: 20),
            Text(
              isDarkMode ? "Mode Gelap Aktif" : "Mode Terang Aktif",
              style: TextStyle(
                fontSize: 20,
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
