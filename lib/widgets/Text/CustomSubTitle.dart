import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle(
      {Key? key, required this.text, this.fontSize = 25, this.bold = false})
      : super(key: key);

  final String text;
  final double fontSize;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.raleway(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.bold : null));
  }
}
