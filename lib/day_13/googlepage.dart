import 'package:flutter/material.dart';

class Googlepage extends StatefulWidget {
  const Googlepage({super.key});

  @override
  State<Googlepage> createState() => _GooglepageState();
}

class _GooglepageState extends State<Googlepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GOOGLE PAGE")),
      backgroundColor: Colors.grey[200],

      // body: Column(
      //   children: [Image.asset('assets/image/hutan.jpg', fit: BoxFit.cover)],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
      // backgroundColor: Colors.grey[200],
      // Container(
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(image: AssetImage('assets/image/hutan.png')),
      //   ),
      // ),
    );
  }
}
