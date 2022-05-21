import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle(
      {Key? key,
      required this.text,
      this.fontSize = 40,
      this.bold = false,
      this.color = Colors.white})
      : super(key: key);

  final String text;
  final double fontSize;
  final Color color;
  final bool bold;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.raleway(
          color: color,
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.w800 : FontWeight.bold,
        ));
  }
}
