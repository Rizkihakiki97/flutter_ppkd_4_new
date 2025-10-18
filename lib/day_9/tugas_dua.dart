import 'package:flutter/material.dart';

class TugasDua extends StatelessWidget {
  const TugasDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        title: Text("Profile"),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/image/fotosatu1010.jpg'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 70,
                  children: [
                    Text("Rizky Hakiki"),
                    SizedBox(height: 6), // jarak antara nama dan deskripsi
                  ],
                ),
              ],
            ), 
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text("My Developer"),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.email),
                SizedBox(width: 6),
                Text("muhammdhakiki97@gmail.com"),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                SizedBox(width: 6),
                Text("089615674013"),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 116, 235),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text("Postingan")),
                  ),
                ),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xffBADFDB),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text("Followers")),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 205, 208, 212),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text("MY Dashboard")),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text("Followers")),
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
