import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/ShapeFormOne.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerMessage extends StatelessWidget {
  final int counter;
  final int points;
  const AnswerMessage({Key? key, required this.counter, required this.points})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 335,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    const CustomSubTitle(
                      text: '!Felicitaciones!',
                      fontSize: 28,
                      bold: true,
                    ),
                    CustomSubTitle(
                      text: '${counter} correctas',
                      fontSize: 25,
                      bold: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Image.asset(
                      'assets/trophy.png',
                      scale: 1,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomSubTitle(text: '+${points} Puntos'),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home', (Route<dynamic> route) => false);
                      },
                      style:
                          ElevatedButton.styleFrom(primary: HexColor('4557FF')),
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          'Regresar',
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: HexColor('4557FF'),
                  radius: 50,
                  child: const Icon(
                    Icons.flag,
                    color: Colors.white,
                    size: 45,
                  ),
                )),
          ],
        ));
  }
}
