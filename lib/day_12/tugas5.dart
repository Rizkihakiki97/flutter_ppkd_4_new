import 'package:flutter/material.dart';

class ElevatedbuttonTugas1 extends StatefulWidget {
  const ElevatedbuttonTugas1({super.key});

  @override
  State<ElevatedbuttonTugas1> createState() => _State2Day12State();
}

class _State2Day12State extends State<ElevatedbuttonTugas1> {
  bool showName = false;
  bool isLiked = false;
  String name = 'Rizky Hakiki';
  bool selengkapnya = false;
  num angka = 0;
  bool text = false;
  int aangka = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                angka++;
              });
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                angka--;
              });
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Profile Interaksi'),
        backgroundColor: Color(0xff90D1CA),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(showName ? 'Nama Saya: $name' : ''),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffC5B0CD),
                    ),
                    onPressed: () {
                      setState(() {
                        showName = !showName;
                      });
                    },
                    onLongPress: () {
                      print('Nama Saya: Rizky Hakiki');
                    },
                    child: Text(
                      'Tampilkan Nama',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: isLiked ? Colors.red : Colors.grey,
                        size: 30,
                      ),
                      const SizedBox(height: 5),

                      if (isLiked)
                        const Text(
                          'KamuSukaa',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 175, 172, 172),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
                if (selengkapnya)
                  Text("ssssfkdjlgvghfjytdvtydvrtdtrdrtdvrvdrfdtyubu"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    // style: ElevatedButton.styleFrom(backgroundColor: Colors.blue)
                    onPressed: () {
                      print("Tampilkan atau sembunyikan");
                      selengkapnya = !selengkapnya;
                      setState(() {});
                    },
                    child: Text("Tekan Dong"),
                  ),
                ),
                Center(child: Text(angka.toString())),
              ],
            ),
          ),
          Container(
            width: 400,
            height: 200,
            color: Color(0xffFFF199),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                width: double.infinity,
                child: InkWell(
                  splashColor: Color(0xffE9C46A),
                  onTap: () {
                    print("kotak di sentuh");
                    text = !text;
                    setState(() {});
                  },
                  child: Center(child: Text(text ? 'ehh kaget' : '')),
                ),
              ),
            ),
          ),
          Container(
            width: 200,
            height: 100,
            color: Color(0xff6BC5D2),
            child: GestureDetector(
              onTap: () {
                aangka++;
                setState(() {});
                print('di tambah satu =$aangka');
              },
              onDoubleTap: () {
                aangka += 2;
                setState(() {});
                print('di tambah dua =$aangka');
              },
              onLongPress: () {
                aangka += 3;
                setState(() {});
                print('di tambah tiga =$aangka');
              },
              child: Center(child: Text('Tekan Aku')),
            ),
          ),
        ],
      ),
    );
  }
}
