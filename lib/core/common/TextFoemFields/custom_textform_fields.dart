import 'package:flutter/material.dart';
import 'package:rab_salon/core/constants/text_styles.dart';
import 'package:rab_salon/core/constants/color_constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool isPasswordField;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.isPasswordField = false,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return TextFormField(
      obscureText: widget.isPasswordField ? _isObscured : false,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.prefixIcon,
          size: size.height * 0.025,
          color: ColorTheme.maincolor,
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility_off: Icons.visibility,
            color: ColorTheme.maincolor,
            size: size.height * 0.025,
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        )
            : null,
        hintText: widget.hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: size.width * .05),
        hintStyle: GLTextStyles.textformfieldtext(),
        filled: true,
        fillColor: ColorTheme.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide.none,
        ),
      ),
    );


  }
}
