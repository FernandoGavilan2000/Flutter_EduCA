import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeButton extends StatelessWidget {
  const LargeButton(
      {Key? key,
      required this.title,
      this.background = Colors.white,
      this.color = const Color.fromARGB(255, 54, 101, 255)})
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
                color: color, fontSize: 28, fontWeight: FontWeight.w500)),
        Container(
          child: const Icon(
            Icons.navigate_next,
            size: 30,
            color: Colors.white,
          ),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        )
      ]),
      width: 230,
      height: 70,
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(50)),
    );
  }
}
