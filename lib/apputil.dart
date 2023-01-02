import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppUtil {
  static TextStyle appBarheading = GoogleFonts.roboto(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18);
  static TextStyle heading1 = GoogleFonts.roboto(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15);
  static TextStyle weekdays = GoogleFonts.roboto(
      color: Colors.black, fontWeight: FontWeight.w600, fontSize: 13);
  static TextStyle enabledtimes = GoogleFonts.roboto(
      color: Colors.purple, fontWeight: FontWeight.w500, fontSize: 13);

  static TextStyle disabledtimes = GoogleFonts.roboto(
      color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 13);
  static const Color primaryclr = Colors.purple;
  static const Color secndaryclr = Colors.grey;
}
