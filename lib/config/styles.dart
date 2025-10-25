import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  const AppStyles._();

  static TextStyle authText = GoogleFonts.comfortaa(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 19.sp,
    fontStyle: FontStyle.normal,
  );

  static TextStyle taskText = GoogleFonts.comfortaa(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    fontStyle: FontStyle.normal,
  );

  static TextStyle bottomNavSelected = GoogleFonts.comfortaa(
    color: Color(0xFF4F46E5),
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    fontStyle: FontStyle.normal,
  );

  static TextStyle bottomNavUnselected = GoogleFonts.comfortaa(
    color: Color(0xFF4B5563),
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    fontStyle: FontStyle.normal,
  );
}
