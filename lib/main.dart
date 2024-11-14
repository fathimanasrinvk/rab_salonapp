import 'package:flutter/material.dart';
import 'package:rab_salon/presentation/LoginScreen/view/login_screen.dart';
import 'package:rab_salon/presentation/OnboardingScreen/view/Onboarding_screen.dart';
import 'package:rab_salon/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: StatusNavigationBar(),
      home: OnboardingScreen(),
    );
  }
}
