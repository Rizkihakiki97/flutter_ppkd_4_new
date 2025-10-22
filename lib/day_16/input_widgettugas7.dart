import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_16/tugas7_checkbox.dart';
import 'package:flutter_ppkd_4_new/day_16/tugas7_datepicker.dart';
import 'package:flutter_ppkd_4_new/day_16/tugas7_dropdown.dart';
import 'package:flutter_ppkd_4_new/day_16/tugas7_switch.dart';
import 'package:flutter_ppkd_4_new/day_16/tugas7_timepicker.dart';

class InputWidgetDay16 extends StatefulWidget {
  const InputWidgetDay16({super.key});

  @override
  State<InputWidgetDay16> createState() => _InputWidgetDay16State();
}

class _InputWidgetDay16State extends State<InputWidgetDay16> {
  //Index untuk menentukan menu mana yang aktif
  int _selectedIndex = 0;

  //List judul dan widget sesuai urutan
  final List<String> _titles = [
    'Checkbox',
    'Switched',
    'Dropdown',
    'Date Picker',
    'Time Picker',
  ];

  static const List<Widget> _widgetOption = [
    Tugas7Checkbox(),
    Tugas7Switch(),
    Tugas7Dropdown(),
    Tugas7Datepicker(),
    Tugas7Timepicker(),
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
        backgroundColor: const Color(0xff96A78D),
      ),

      //Drawer menu di sisi kiri
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header Drawer
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xffE8DFCA)),
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
              title: const Text('Checkbox'),
              onTap: () {
                setState(() => _selectedIndex = 0);
                Navigator.pop(context); // Tutup drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.toggle_on),
              title: const Text('Switched'),
              onTap: () {
                setState(() => _selectedIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.arrow_drop_down_circle_outlined),
              title: const Text('Dropdown'),
              onTap: () {
                setState(() => _selectedIndex = 2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today_outlined),
              title: const Text('Date Picker'),
              onTap: () {
                setState(() => _selectedIndex = 3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text('Time Picker'),
              onTap: () {
                setState(() => _selectedIndex = 4);
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
