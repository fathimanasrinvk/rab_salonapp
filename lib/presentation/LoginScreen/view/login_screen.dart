import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/images/loginbg.png"),
    fit: BoxFit.cover,
    ),),
     )
    );
  }
}
