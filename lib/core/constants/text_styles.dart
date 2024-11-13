import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rab_salon/core/constants/color_constants.dart';

class GLTextStyles {
  static headding({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.rakkas(
      fontSize: size ?? 40.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.maincolor,
    );
  }
   static onboardingtext1({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.rakkas(

      fontSize: size ?? 24.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.black,
    );
  }
  static onboardingtext2({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.lato(
      fontSize: size ?? 15.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.black,
    );
  }
    static onboardingbutton({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.rakkas(
      fontSize: size ?? 15.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.white,
    );
  }
   static locationtext({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.rakkas(
      fontSize: size ?? 15.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.black,
    );
  }
  static textformfieldtext({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.lato(
      fontSize: size ?? 12.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.maincolor,
    );
  }
   static textformfieldtext2({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.lato(
      fontSize: size ?? 12.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.lightgrey,
    );
  }
   static registertxt1({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.lato(
      fontSize: size ?? 15.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.white,
    );
  }
   static registerbuttontext({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.lato(
      fontSize: size ?? 12.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.white,
    );
  }
    static registertxt2({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.lato(
      fontSize: size ?? 15.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.maincolor,
    );
  }
  static subheadding({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.lato(
      fontSize: size ?? 20.sp,
      fontWeight: weight ?? FontWeight.bold,
      color: color ?? ColorTheme.black,
    );
  }
    static greytxt({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.lato(
      fontSize: size ?? 15.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.lightgrey,
    );
  }
   static drawertext({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.lato(
      fontSize: size ?? 10.sp,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? ColorTheme.black,
    );
  }
}
