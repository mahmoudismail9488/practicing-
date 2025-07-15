import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: lightContainerColor,
  scaffoldBackgroundColor: lightBackgroundColor,
  // text theme
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
    labelMedium: TextStyle(
      color: lightFormLabelColor,
      fontSize: 16,
      fontFamily: GoogleFonts.roboto.toString(),
      fontWeight: FontWeight.w500,
    ),
  ),
  // Elevated button theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      backgroundColor: lightContainerColor,
      foregroundColor: Colors.white,
    ),
  ),
  // outlined button them
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(width: 1, color: lightContainerColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      backgroundColor: Colors.white,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: darkContainerColor,
  scaffoldBackgroundColor: darkBackgroundColor,
  // text theme
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
    labelMedium: TextStyle(
      color: darkFormLabelColor,
      fontSize: 16,
      fontFamily: GoogleFonts.roboto.toString(),
      fontWeight: FontWeight.w500,
    ),
  ),
  // Elevated button theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      backgroundColor: darkContainerColor,
      foregroundColor: Colors.white,
    ),
  ),
  // outlined button them
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(width: 1, color: lightContainerColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      backgroundColor: Colors.white,
    ),
  ),
);
