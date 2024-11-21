import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomInputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context); // Get screen size
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.014),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText,
              style: GLTextStyles
                  .textformfieldtitle() // Adjust the style as needed
              ),
          SizedBox(height: size.height * 0.01),
          Container(
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
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GLTextStyles
                    .textformfieldtext2(), // Replace with your custom text style
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.015,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
