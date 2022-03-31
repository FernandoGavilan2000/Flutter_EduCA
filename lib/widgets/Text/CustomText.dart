import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.fontSize = 22,
      this.bold = false,
      this.color = Colors.black})
      : super(key: key);

  final String text;
  final double fontSize;
  final bool bold;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.raleway(
            color: color,
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.bold : null));
  }
}
