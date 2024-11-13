import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rab_salon/core/constants/color_constants.dart';

class GLTextStyles {
  static headding({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.rakkas(
      fontSize: size ?? 30,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.white,
    );
  }
}
