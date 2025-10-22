import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_16/input_widgettugas7.dart';

class NavbarWidgetDay16 extends StatefulWidget {
  const NavbarWidgetDay16({super.key});

  @override
  State<NavbarWidgetDay16> createState() => _NavbarWidgetDay16State();
}

class _NavbarWidgetDay16State extends State<NavbarWidgetDay16> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const InputWidgetDay16(), _AboutPage()];

  // final List<String> _titles = [
  //   'Home - Input Widget Day 16',
  //   'Tentang Aplikasi',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_titles[_selectedIndex]),
      //   backgroundColor: Colors.blueAccent,
      // ),

      // Body berubah sesuai index
      body: _pages[_selectedIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
      ),
    );
  }
}

// Halaman Tentang Aplikasi (dipisah biar rapi)
class _AboutPage extends StatelessWidget {
  const _AboutPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.security_rounded,
              size: 80,
              color: Color.fromARGB(255, 41, 41, 41),
            ),
            SizedBox(height: 20),
            Text(
              'Aplikasi Keamanan Siber widget',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Alat untuk network monitoring seperti Wireshark dan NMAP, solusi keamanan siber profesional seperti Kali Linux dan Cortex XDR, serta aplikasi end-user untuk keamanan seluler seperti Norton Mobile Security dan Bitdefender Mobile Security Checkbox, Switch, Dropdown, DatePicker, dan TimePicker',
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Dibuat oleh: RIZKY HAKIKI',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
              ),
            ),
            // SizedBox(height: 8),
            Text('Versi Aplikasi: 1.0.0', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
