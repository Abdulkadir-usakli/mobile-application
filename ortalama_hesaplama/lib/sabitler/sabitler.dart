import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const anaRenk = Colors.indigo;

  static const String baslikText = 'ORTALAMA HESAPLA';
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: anaRenk,
  );
  static BorderRadius borderRadius = BorderRadius.circular(24);
  static final TextStyle dersStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: anaRenk,
  );
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w900,
    color: anaRenk,
  );
}
