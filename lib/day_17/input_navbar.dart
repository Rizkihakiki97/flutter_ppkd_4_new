import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_17/tugas9_listmap.dart';
import 'package:flutter_ppkd_4_new/day_17/tugas9_listview.dart';
import 'package:flutter_ppkd_4_new/day_17/tugas9_listview_model.dart';

class InputWidgetDay17 extends StatefulWidget {
  const InputWidgetDay17({super.key});

  @override
  State<InputWidgetDay17> createState() => _InputWidgetDay17State();
}

class _InputWidgetDay17State extends State<InputWidgetDay17> {
  //Index untuk menentukan menu mana yang aktif
  int _selectedIndex = 0;

  //List judul dan widget sesuai urutan
  final List<String> _titles = [
    'Kategori',
    'Kategori Minuman',
    'Kategori Two',

    // 'Checkbox',
    // 'Switched',
    // 'Dropdown',
    // 'Date Picker',
    // 'Time Picker',
  ];

  static const List<Widget> _widgetOption = [
    Tugas9ListmapDay17(),
    Tugas9ListviewModelDay17(),
    Tugas9List17Day(),
  ];

  void onTapDrawer(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('System App'),
        backgroundColor: const Color(0xffBADFDB),
      ),

      //Drawer menu di sisi kiri
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header Drawer
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xffFFD5D5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.widgets, color: Colors.black, size: 48),
                  SizedBox(height: 10),
                  Text(
                    'System App 16',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

            //List menu
            ListTile(
              leading: const Icon(Icons.check_box_outlined),
              title: const Text('Category Two'),
              onTap: () {
                setState(() => _selectedIndex = 0);
                Navigator.pop(context); // Tutup drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.battery_charging_full),
              title: const Text('Beverage Category'),
              onTap: () {
                setState(() => _selectedIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Category'),
              onTap: () {
                setState(() => _selectedIndex = 2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      //Konten sesuai menu aktif
      body: _widgetOption[_selectedIndex],
    );
  }
}
