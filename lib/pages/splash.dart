import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:groccery_app/auth/login.dart';
import 'package:groccery_app/screens/home.dart';

class SplashPage extends StatefulWidget {
 const SplashPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
          'assets/1.png'),
      title:const Text(
        "Fresh Fruits",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.orange,
      showLoader: false,
     // loadingText:const Text("Fresh Fruits"),
      navigator: HomePage(title: '',),
      durationInSeconds: 3,
    );
  }
}