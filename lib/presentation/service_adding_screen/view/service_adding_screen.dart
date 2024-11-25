import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';


class ServiceAddingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('RABLOON', style: GLTextStyles.subheadding()),
            Text('LOCATION', style: GLTextStyles.locationtext()),
          ],
        ),
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
                        padding: EdgeInsets.only(top: size.height * 0.05),
                        child: Text('Add Your Saloon Services', style: GLTextStyles.subheadding2()),
                      ),

                      // Service Name
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.04),
                        child: Text('Service Name', style: GLTextStyles.textformfieldtitle()),
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
                            decoration: InputDecoration(
                              hintText: 'Enter Your Service Name',
                              hintStyle: GLTextStyles.textformfieldtext2(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.015),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: Text('Category Name', style: GLTextStyles.textformfieldtitle()),
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
                            decoration: InputDecoration(
                              hintText: 'Enter the Category',
                              hintStyle: GLTextStyles.textformfieldtext2(),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.015),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: size.height * 0.03),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Price', style: GLTextStyles.textformfieldtitle()),
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
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: 'Price',
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
                          SizedBox(width: size.width * 0.05),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Gender', style: GLTextStyles.textformfieldtitle()),
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
                                    child: DropdownButtonFormField<String>(
                                      isExpanded: true,
                                      isDense: true,
                                      decoration: InputDecoration(
                                        hintText: 'Select Gender',
                                        labelStyle: TextStyle(color: Colors.black),
                                        floatingLabelBehavior: FloatingLabelBehavior.never,
                                        // contentPadding: EdgeInsets.symmetric(
                                        //   horizontal: size.width * 0.04,
                                        //   vertical: size.height * 0.01,
                                        // ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: BorderSide(color: Colors.transparent),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: BorderSide(color: Colors.transparent),
                                        ),
                                      ),
                                      value: 'Women',
                                      items: ['Women', 'Men', 'Other']
                                          .map((gender) => DropdownMenuItem(
                                        value: gender,
                                        child: Text(gender),
                                      ))
                                          .toList(),
                                      onChanged: (value) {
                                        // Handle gender selection
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                      child: Text('SAVE AND NEW', style: GLTextStyles.saveandnewbutton()),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorTheme.maincolor,
                    ),
                    height: size.height * 0.05,
                    width: size.width * 0.45,
                    child: Center(
                      child: Text('SAVE', style: GLTextStyles.onboardingandsavebutton()),
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
