import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MediumButton extends StatelessWidget {
  const MediumButton(
      {Key? key,
      required this.title,
      this.background = const Color.fromARGB(255, 29, 86, 245),
      this.color = Colors.white})
      : super(key: key);

  final String title;
  final Color background;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(title,
            style: GoogleFonts.raleway(
                color: color, fontSize: 24, fontWeight: FontWeight.w500)),
        Container(
          child: Icon(
            Icons.navigate_next,
            size: 30,
            color: background,
          ),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        )
      ]),
      width: 200,
      height: 70,
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(50)),
    );
  }
}
