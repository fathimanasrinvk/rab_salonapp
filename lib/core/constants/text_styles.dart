import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rab_salon/core/constants/color_constants.dart';

class GLTextStyles {
  static headding({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.rakkas(
      fontSize: size ?? 40,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.maincolor,
    );
  }
   static onboardingtext1({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.rakkas(
      fontSize: size ?? 24,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.black,
    );
  }
  static onboardingtext2({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.rakkas(
      fontSize: size ?? 15,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.black,
    );
  }
}
