import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/presentation/bottom_navigation_screen/view/bottom_navigation_screen.dart';
import 'package:rab_salon/presentation/service_screen/view/service_screen.dart';

class ServiceAddingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final _formKey = GlobalKey<FormState>(); // Form key for validation
    String? selectedGender; // Variable to store selected gender

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('RABLOON', style: GLTextStyles.subheadding()),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorTheme.maincolor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OwnerBottomNavigationScreen(),
              ),
            );
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Add Your Saloon Services',
                          style: GLTextStyles.subheadding2()),
                      _buildTextField(
                        context: context,
                        title: 'Service Name',
                        hint: 'Enter Your Service Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the service name';
                          }
                          return null;
                        },
                      ),
                      _buildTextField(
                        context: context,
                        title: 'Category Name',
                        hint: 'Enter the Category',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the category name';
                          }
                          return null;
                        },
                      ),
                      _buildTextField(
                        context: context,
                        title: 'Price',
                        hint: 'Enter the Price',
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the price';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03),
                        child: Text('Gender',
                            style: GLTextStyles.textformfieldtitle()),
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
                          child: DropdownButtonFormField<String>(
                            dropdownColor: ColorTheme.secondarycolor,
                            isExpanded: true,
                            isDense: true,
                            decoration: InputDecoration(
                              hintText: 'Select',
                              hintStyle: GLTextStyles.textformfieldtext2(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04,
                                vertical: size.height * 0.01,
                              ),
                              border: InputBorder.none,
                            ),
                            value: selectedGender,
                            items: ['Select', 'Women', 'Men', 'Other']
                                .map((gender) => DropdownMenuItem(
                                      value: gender == 'Select' ? null : gender,
                                      child: Text(gender),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              selectedGender = value;
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select a gender';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: ColorTheme.white,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.07,
          vertical: size.height * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Save and add new logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Saved and ready for new entry')),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorTheme.maincolor,
                      width: 1,
                    ),
                    color: ColorTheme.white,
                  ),
                  height: size.height * 0.05,
                  child: Center(
                    child: Text(
                      'SAVE AND NEW',
                      style: GLTextStyles.saveandnewbutton(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: size.width * 0.05),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // Save logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Form submitted successfully')),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.maincolor,
                  ),
                  height: size.height * 0.05,
                  child: Center(
                    child: Text(
                      'SAVE SERVICE',
                      style: GLTextStyles.onboardingandsavebutton(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required String title,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GLTextStyles.textformfieldtitle()),
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
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: GLTextStyles.textformfieldtext2(),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.015,
                  ),
                ),
                validator: validator,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


              // // Positioned buttons at the bottom
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: size.width * 0.02,
              //     right: size.width * 0.02,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: ColorTheme.maincolor,
              //             width: 1,
              //           ),
              //           color: ColorTheme.white,
              //         ),
              //         height: size.height * 0.05,
              //         width: size.width * 0.45,
              //         child: Center(
              //           child: Text('SAVE AND NEW', style: GLTextStyles.saveandnewbutton()),
              //         ),
              //       ),
              //       Container(
              //         decoration: BoxDecoration(
              //           color: ColorTheme.maincolor,
              //         ),
              //         height: size.height * 0.05,
              //         width: size.width * 0.45,
              //         child: Center(
              //           child: Text('SAVE', style: GLTextStyles.onboardingandsavebutton()),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
