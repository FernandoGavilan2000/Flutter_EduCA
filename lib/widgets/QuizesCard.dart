import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizesCard extends StatelessWidget {
  const QuizesCard(
      {Key? key,
      required this.coloFondo,
      required this.description,
      required this.title,
      required this.coursePath,
      required this.sizeTitle,
      required this.quizzID})
      : super(key: key);
  final Color coloFondo;
  final String title;
  final String description;
  final double sizeTitle;
  final String quizzID;
  final String coursePath;

  @override
  Widget build(BuildContext context) {
    final Map<String, String> data = {
      'coursePath': coursePath,
      'quizzID': quizzID,
    };
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/quiz_demo', arguments: data);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        width: double.infinity,
        decoration: BoxDecoration(
            color: coloFondo,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: sizeTitle,
                    fontWeight: true ? FontWeight.bold : null)),
            const SizedBox(
              height: 2,
            ),
            Text(
              description,
              style: const TextStyle(color: Colors.white, fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
