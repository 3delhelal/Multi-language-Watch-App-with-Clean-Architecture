import '/Core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData tempTheme() {
  return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: backGroundColor,
      textTheme: TextTheme(
        bodySmall: GoogleFonts.poppins(fontSize: 16.0, color: Colors.white),
        bodyMedium: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: Colors.white70),
        bodyLarge: GoogleFonts.poppins(
            fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white70),
        headlineMedium: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: Colors.white70),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 15,
          letterSpacing: 0.1,
          color: Colors.white70,
        ),
      ),
      iconTheme: const IconThemeData(
        size: 16.0,
        color: Colors.white70,
      ));
}
