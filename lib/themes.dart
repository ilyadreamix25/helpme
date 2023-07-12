import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData helpMeTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Color(0xFFFFCC00),
    onPrimary: Colors.black,
    primaryContainer: Color.fromARGB(255, 255, 222, 90)
  ),
  appBarTheme: const AppBarTheme(
    shadowColor: Colors.transparent,
    elevation: 0
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.fromLTRB(28, 16, 28, 16),
      textStyle: TextStyle(
        fontSize: 16,
        fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w500).fontFamily,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
        color: Colors.black,
        width: 1,
      ),
      shape: const StadiumBorder(),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.fromLTRB(28, 16, 28, 16),
      textStyle: TextStyle(
        fontSize: 16,
        fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w500).fontFamily,
      ),
      splashFactory: NoSplash.splashFactory,
    ),
  ),
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      fontSize: 24,
      fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w500).fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w700).fontFamily,
    ),
    titleSmall: TextStyle(
      fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w700).fontFamily,
      fontSize: 22,
    ),
    headlineSmall: TextStyle(
      fontSize: 28,
      fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w700).fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w500).fontFamily,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16),
    filled: true,
    fillColor: Colors.black,
    hintStyle: TextStyle(
      fontSize: 18,
      fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w500).fontFamily,
      color: Colors.white.withOpacity(0.75),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16)
      ),
      borderSide: BorderSide(color: Colors.transparent)
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16)
      ),
      borderSide: BorderSide(color: Colors.transparent)
    ),
    prefixIconColor: Colors.white,
    prefixStyle: TextStyle(
      fontSize: 18,
      fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w500).fontFamily,
      color: Colors.white,
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: Colors.black,
    selectionHandleColor: Colors.white,
    cursorColor: Colors.white,
  ),
  splashFactory: NoSplash.splashFactory,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
);
