import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Colors.indigo;
  static final TextStyle tittleStyle = GoogleFonts.aBeeZee(
      color: mainColor, fontSize: 24, fontWeight: FontWeight.w900);
  static BorderRadius borderRadius =
      BorderRadius.all(Radius.elliptical(20, 20));
  static TextStyle lessonNumberStyle = GoogleFonts.actor(color: mainColor,fontSize: 24,fontWeight: FontWeight.bold);
   static TextStyle averageStyle = GoogleFonts.alegreyaSc(
      color: mainColor, fontSize: 30, fontWeight: FontWeight.bold);
}
