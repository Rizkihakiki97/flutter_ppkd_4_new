import 'package:flutter/material.dart';

class StateDay12 extends StatefulWidget {
  const StateDay12({super.key});

  @override
  State<StateDay12> createState() => _StateDay12State();
}

class _StateDay12State extends State<StateDay12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("State 1 Counter")),
body: Column(
  children: [
    Text("Tambah tambah", style: TextStyle(fontSize: 30)),
    Text("",
      
      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
    ),
          ],
       ),
     ); 
   }
} 