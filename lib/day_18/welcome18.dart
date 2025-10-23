import 'package:flutter/material.dart';

class Welcome18 extends StatefulWidget {
  const Welcome18({super.key, required this.name, required this.domisili});
  final String name;
  final String domisili;

  @override
  State<Welcome18> createState() => _Welcome18State();
}

class _Welcome18State extends State<Welcome18> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.home))],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: Center(
        child: Text(
          'Terimakasih ${widget.name} dari ${widget.domisili} telah mendaftar',
        ),
      ),
    );
  }
}
