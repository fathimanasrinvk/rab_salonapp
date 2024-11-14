import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import '../../../core/common/TextFoemFields/custom_textform_fields.dart';
import '../../../core/constants/color_constants.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/loginbg.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.06),
                  child: Text(
                    "RABELLA",
                    style: GLTextStyles.headding(),
                  ),
                ),
                SizedBox(height: size.height * 0.06),
                Text(
                  "Unlock your beauty business with a single tap",
                  textAlign: TextAlign.center,
                  style: GLTextStyles.registertxt1(),
                ),
                SizedBox(height: size.height * 0.077),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.06),
                  child: CustomTextFormField(
                    hintText: "Username",
                    prefixIcon: Icons.person,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.06,
                      vertical: size.height * 0.02),
                  child: CustomTextFormField(
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                    isPasswordField: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.06,
                      vertical: size.height * 0.03),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorTheme.maincolor,
                      // color: ColorTheme.secondarycolor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: double.infinity,
                    height: size.height * 0.052,
                    child: Center(
                      child: Text('Login',
                          style: TextStyle(color: ColorTheme.white)),
                    ),
                  ),
                ),
                // Register as owner text button
                TextButton(
                  onPressed: () {
                    // Handle register action here
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Register as an owner",
                          style: GLTextStyles.registerbuttontext()),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_forward,
                        color: ColorTheme.white,
                        size: size.height * 0.02,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
