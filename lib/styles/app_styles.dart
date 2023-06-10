import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
// Color styles
  static Color text1Color = const Color.fromARGB(255, 83, 83, 83);
  static Color text2Color = const Color.fromARGB(255, 109, 109, 109);
  static Color redColor = const Color.fromARGB(255, 217, 81, 81);
  static Color orangeColor = const Color.fromARGB(255, 217, 150, 81);
  static Color navIconsColor = const Color.fromARGB(255, 139, 139, 139);
  static Color textFieldColor = const Color.fromARGB(127, 139, 139, 139);

// Font styles
  static TextStyle textStyle1 = GoogleFonts.inter(
    fontSize: 95,
    color: Colors.white,
    fontWeight: FontWeight.w200,
    shadows: [const Shadow(blurRadius: 15.0, color: Color.fromARGB(150, 0, 0, 0), offset: Offset(2.0, 2.0))],
  );
  static TextStyle textStyle2 = GoogleFonts.inter(
    fontSize: 40,
    color: Colors.white,
    fontWeight: FontWeight.w300,
    shadows: [const Shadow(blurRadius: 15.0, color: Color.fromARGB(190, 0, 0, 0), offset: Offset(2.0, 2.0))],
  );
  static TextStyle textStyle3 = GoogleFonts.inter(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.w300,
    shadows: [const Shadow(blurRadius: 15.0, color: Color.fromARGB(190, 0, 0, 0), offset: Offset(2.0, 2.0))],
  );
}
