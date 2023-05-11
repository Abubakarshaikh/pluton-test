import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static get standard {
    return ThemeData(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Colors.red,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF000000),
      ),
      scaffoldBackgroundColor: const Color(0xFF131212),
      textTheme: GoogleFonts.openSansTextTheme().copyWith(
        bodySmall: GoogleFonts.openSans(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: GoogleFonts.openSans(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: GoogleFonts.openSans(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.openSans(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF131212),
      ),
    );
  }

  AppTheme._();
}
