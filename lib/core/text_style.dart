import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle headLine() => TextStyle(
    fontSize: 18.0.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static TextStyle appBarText() => TextStyle(
    color: Colors.black,
    fontSize: 16.0.sp,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextStyle title() => TextStyle(
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontFamily: GoogleFonts.poppins().fontFamily,
    height: 1.2.h,
  );
  static TextStyle bodyText() => TextStyle(
    fontSize: 13.0.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
  static TextStyle subTitle() => TextStyle(
    fontSize: 12.0.sp,
    color: Colors.grey,
    height: 1.0.h,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );
}