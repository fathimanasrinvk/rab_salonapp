import 'dart:async';

import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // void initState() {
  //   // Timer(Duration(seconds: 3), () {
  //   //   Navigator.of(context).pushReplacement(
  //   //       MaterialPageRoute(builder: (context) => OnboardingScreen()));
  //   // });
  //   // super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
    );
  }
}