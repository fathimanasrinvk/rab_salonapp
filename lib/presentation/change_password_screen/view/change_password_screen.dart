import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.white,
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("RABLOON", style: GLTextStyles.subheadding()),
          ],
        ),
      ),
      backgroundColor: ColorTheme.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              context: context,
              title: 'Current Password',
              hint: 'Enter your current password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the current password';
                }
                return null;
              },
            ),
            _buildTextField(
              context: context,
              title: 'Password',
              hint: 'Enter new password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the new password';
                }
                return null;
              },
            ),
            _buildTextField(
              context: context,
              title: 'Re-enter Password',
              hint: 'Re-enter your password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please re-enter the password';
                }
                return null;
              },
            ),
            // Forgot Password Text
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.015),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Add your forgot password logic here
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            // Confirm Button
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.05),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your confirm logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.maincolor, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.25,
                      vertical: size.height * 0.02,
                    ),
                  ),
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: ColorTheme.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
