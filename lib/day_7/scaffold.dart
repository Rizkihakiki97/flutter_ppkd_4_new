import 'package:flutter/material.dart';

class Tugas1Scaffold extends StatelessWidget {
  const Tugas1Scaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        title: Text("Profile saya"),
      ),
      backgroundColor: const Color.fromARGB(255, 243, 191, 196),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/image/fotosatu1010.jpg'),
            ),

            Text(
              "Nama : Muhamad rizky hakiki",
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 10, 10, 10),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.yellow, Colors.green],
                    ),
                  ),
                  child: Text("Jakarta Pusat", style: TextStyle(fontSize: 17)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Lagi belajar di PPKD Jakarta pusat, Programming Mobile.",
                  style: TextStyle(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 10, 10, 10),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
