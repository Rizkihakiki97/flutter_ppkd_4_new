import 'package:flutter/material.dart';
import 'package:flutter_ppkd_4_new/day_18/apps_login_screen.dart';
import 'package:flutter_ppkd_4_new/day_18/day_18/preference/preference_handler.dart';
import 'package:flutter_ppkd_4_new/day_18/home_screen.dart';
// import 'package:flutter_ppkd_4_new/day_18/preference/preference_handler.dart';

class SplashScreenDay18 extends StatefulWidget {
  const SplashScreenDay18({super.key});

  @override
  State<SplashScreenDay18> createState() => _SplashScreenDay18State();
}

class _SplashScreenDay18State extends State<SplashScreenDay18> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() async {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var isLogin = await PreferenceHandler.getLogin();
      print(isLogin);
      if (isLogin != null && isLogin == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => AppsLogin()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/image/aqua.jpg')),
          Text(
            "Apel Apps",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
