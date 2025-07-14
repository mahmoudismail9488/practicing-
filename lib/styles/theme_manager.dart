import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: lightContainerColor,
  scaffoldBackgroundColor: lightBackgroundColor,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: lightLabelTextColor,
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.poppins.toString(),
      fontSize: 14,
    ),

    titleMedium: TextStyle(
      color: lightContainerColor,
      fontWeight: FontWeight.w800,
      fontFamily: GoogleFonts.poppins.toString(),
      fontSize: 16,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: darkContainerColor,
  scaffoldBackgroundColor: darkBackgroundColor,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: lightLabelTextColor,
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.poppins.toString(),
      fontSize: 14,
    ),
    titleMedium: TextStyle(
      color: darkTitleTextColor,
      fontWeight: FontWeight.w800,
      fontFamily: GoogleFonts.poppins.toString(),
      fontSize: 16,
    ),
  ),
);
