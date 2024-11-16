import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rab_salon/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:rab_salon/presentation/service_screen/controller/service_screen_controller.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ServiceController()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatusNavigationBar(),
      // home: OnboardingScreen(),
    );
  }
}
