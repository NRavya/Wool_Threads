// splash_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';
import 'login_choice_page.dart'; // Import the new login choice page

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginChoicePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.7),
      body: Center(
        child: Image.asset('assets/image.png'), // Replace with your logo image
      ),
    );
  }
}
