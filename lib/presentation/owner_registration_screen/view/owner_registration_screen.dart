import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import '../../../core/common/TextFoemFields/custom_textform_fields.dart';
import '../../../core/constants/color_constants.dart';

class OwnerRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/loginbg.png'),
                fit: BoxFit.fill,
              ),
            ),
            height: double.infinity,
            width: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.07),
                  child: Text(
                    "RABLOON",
                    style: GLTextStyles.headding(),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  "Unlock your beauty business with a single tap",
                  textAlign: TextAlign.center,
                  style: GLTextStyles.registertxt1(),
                ),
                SizedBox(height: size.height * 0.045),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.06),
                  child: CustomTextFormField(
                    hintText: "Enter Your Name",
                    prefixIcon: Icons.person,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * 0.06,vertical: size.height * 0.02,
                  ),
                  child: CustomTextFormField(
                    hintText: "Email", prefixIcon: Icons.mail,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.height * 0.06,
                    vertical: size.height * 0.02,
                  ),
                  child: CustomTextFormField(
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                    isPasswordField: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.height * 0.06,
                    vertical: size.height * 0.03,
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>OwnerBottomNavigationScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorTheme.maincolor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: double.infinity,
                      height: size.height * 0.052,
                      child: Center(
                        child: Text(
                          'Register',
                          style: GLTextStyles.registerbuttontext(),
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
