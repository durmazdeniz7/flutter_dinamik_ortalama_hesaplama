import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Sabitler {
  static const MaterialColor anaRenk=Colors.indigo;

  static const String baslikText="Ortalama Hesapla";

  static final TextStyle myTitleStyle=GoogleFonts.quicksand(
    fontSize:24,fontWeight: FontWeight.w900,color: anaRenk
  );

  static BorderRadius borderRadius=BorderRadius.circular(16);

  static final TextStyle ortalamaGosterBodtStyle=GoogleFonts.quicksand(
    fontSize:16,fontWeight: FontWeight.w600,color: anaRenk
  );

    static final TextStyle ortalamaStyle=GoogleFonts.quicksand(
    fontSize:55,fontWeight: FontWeight.w800,color: anaRenk
  );


  static const EdgeInsets dropDownPadding= EdgeInsets.symmetric(horizontal: 16,vertical: 8);

  static const EdgeInsets yatayPadding8= EdgeInsets.symmetric(horizontal:8);

}