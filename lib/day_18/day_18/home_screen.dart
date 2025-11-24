import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_18/apps_login_screen.dart';
import 'package:flutter_ppkd_4_new/day_18/day_18/preference/preference_handler.dart';
// import 'package:flutter_ppkd_4_new/day_18/preference/preference_handler.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            PreferenceHandler.removeLogin();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => AppsLogin()),
              (route) => false,
            );
          },
          child: Text('LogOut'),
        ),
      ),
    );
  }
}
