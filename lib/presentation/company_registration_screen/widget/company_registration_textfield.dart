import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/color_constants.dart';
import 'package:rab_salon/core/constants/text_styles.dart';

class CompanyRegistrationTextField extends StatelessWidget {
  final String label;

  const CompanyRegistrationTextField({required this.label});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * .01),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GLTextStyles.textformfieldtext(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
