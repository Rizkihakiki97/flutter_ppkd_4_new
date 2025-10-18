import 'package:flutter/material.dart';

class GridViewWidgetDay10 extends StatelessWidget {
  const GridViewWidgetDay10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MYapp',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff829460),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text('Nama'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukin Nama Anda',
              ),
            ),
            SizedBox(height: 12),
            Text('Email'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email Anda',
              ),
            ),
            SizedBox(height: 12),
            Text('Nomor HandPhone'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '08121*****',
              ),
            ),
            SizedBox(height: 12),
            Text('Deskripsi'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Deskripsi Anda',
              ),
            ),
            SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Color(0xffC9FDD7),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const Text(
                        'Halo Guys',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Color(0xffC9FDD7),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [const Text('Halo Guys')],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Color(0xffC9FDD7),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [const Text('Halo Guys')],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Color(0xff79D1C3),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [const Text('Halo Guys')],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Color(0xff79D1C3),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [const Text('Halo Guys')],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Color(0xff79D1C3),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [const Text('Halo brayy')],
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
