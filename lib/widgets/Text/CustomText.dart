import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key, required this.text, this.fontSize = 22, this.bold = false})
      : super(key: key);

  final String text;
  final double fontSize;
  final bool bold;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.raleway(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.bold : null));
  }
}
