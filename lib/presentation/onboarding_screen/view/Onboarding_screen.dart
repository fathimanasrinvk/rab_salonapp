import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import '../../login_screen/view/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ColorTheme.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.height * 0.03),
          child: SingleChildScrollView(
            // Added SingleChildScrollView
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/landingpic.jpg',
                    width: size.width * 0.67,
                    height: size.height * 0.35,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: size.height * 0.07),
                Text(
                  'Premier Salon\nManagement Solution',
                  textAlign: TextAlign.center,
                  style: GLTextStyles.onboardingtext1(),
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  'Streamline staff management, assign services, track work, and boost client satisfaction.',
                  textAlign: TextAlign.center,
                  style: GLTextStyles.onboardbottomcardtxt(),
                ),
                SizedBox(height: size.height * 0.08),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.height * 0.06),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorTheme.maincolor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: double.infinity,
                      height: size.height * 0.052,
                      child: Center(
                        child: Text(
                          'GET STARTED',
                          style: GLTextStyles.onboardingandsavebutton(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
