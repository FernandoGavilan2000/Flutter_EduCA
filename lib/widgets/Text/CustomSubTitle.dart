import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle(
      {Key? key,
      required this.text,
      this.fontSize = 25,
      this.bold = false,
      this.align = TextAlign.center,
      this.color = Colors.black})
      : super(key: key);

  final String text;
  final double fontSize;
  final bool bold;
  final Color color;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: align,
        style: GoogleFonts.raleway(
            color: color,
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.bold : null));
  }
}
