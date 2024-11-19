import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';



class PartnersAddingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('RABLOON', style: GLTextStyles.subheadding()),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Use Expanded here to take up remaining space
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First title
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.036),
                        child: Text('Add Your Salon Partners', style: GLTextStyles.subheadding2()),
                      ),

                      // Partner Name
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.04),
                        child: Text('Partner Name', style: GLTextStyles.textformfieldtitle()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.014),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Enter Partner Name',
                              hintStyle: GLTextStyles.textformfieldtext2(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.015),
                            ),
                          ),
                        ),
                      ),

                      // Email
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: Text('Email', style: GLTextStyles.textformfieldtitle()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.014),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Enter Email Address',
                              hintStyle: GLTextStyles.textformfieldtext2(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.015),
                            ),
                          ),
                        ),
                      ),

                      // Username
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: Text('Username', style: GLTextStyles.textformfieldtitle()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.014),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hintText: 'Enter Username',
                              hintStyle: GLTextStyles.textformfieldtext2(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.015),
                            ),
                          ),
                        ),
                      ),

                      // Password
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: Text('Password', style: GLTextStyles.textformfieldtitle()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.014),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(5, 5),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              hintStyle: GLTextStyles.textformfieldtext2(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.015),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Positioned buttons at the bottom
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.02,
                right: size.width * 0.02,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorTheme.maincolor,
                        width: 1,
                      ),
                      color: ColorTheme.white,
                    ),
                    height: size.height * 0.05,
                    width: size.width * 0.45,
                    child: Center(
                      child: Text('SAVE AND NEW ', style: GLTextStyles.saveandnewbutton()),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorTheme.maincolor,
                    ),
                    height: size.height * 0.05,
                    width: size.width * 0.45,
                    child: Center(
                      child: Text('SAVE PARTNER', style: GLTextStyles.onboardingandsavebutton()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
