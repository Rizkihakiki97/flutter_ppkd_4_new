import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_16/page_with_navbar.dart';
// import 'package:flutter_ppkd_4_new/day_16/tugas7_checkbox.dart';
// import 'package:flutter_ppkd_4_new/day_15/googlepage.dart';
// import 'package:flutter_ppkd_4_new/day_15/homescreen.dart';
// import 'package:flutter_ppkd_4_new/day_13/tugas_enam.dart';
// import 'package:flutter_application_1/day_10/tugas_empat.dart';
// import 'package:flutter_application_1/day_12/tugas_state1.dart';
// import 'package:flutter_application_1/day_12/tugas5.dart';
// import 'package:flutter_application_1/day_13/tugas_6_login.dart';

// import 'package:flutter_application_1/day_10/tugas_tiga.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // '/homescreen': (context) => const Homescreen(),
        // '/googlepage': (context) => const Googlepage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 148, 202, 230),
        ),
      ),
      home: const PageWithNavbar(),
    );
  }
}
