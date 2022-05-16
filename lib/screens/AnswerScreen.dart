import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import 'package:flutter_educa/widgets/Text/CustomText.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color.fromRGBO(69, 84, 255, 1),
            Color.fromRGBO(61, 168, 255, 1)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 14,
              child: Container(
                margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: CustomSubTitle(
                        text: 'Comunicación',
                        color: Colors.white,
                        bold: true,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleStep(step: '1'),
                    CircleStep(step: '2'),
                    CircleStep(step: '3'),
                    CircleStep(step: '4'),
                    CircleStep(step: '5'),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 78,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(35))),
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
                  padding: EdgeInsets.all(28),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: '1.',
                        bold: true,
                        color: Colors.black,
                        fontSize: 45,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "¿Cómo quedó en su ultima batalla el caballero carmelo en la obra literaria leída?",
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      option("A. Muy entusiasmado"),
                      option('B. Gravamente herido'),
                      option('C. Triste por su oponente'),
                      option('D. Sin un ojo'),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

//Widget para las opciones
Widget option(String option) {
  return Container(
    width: double.infinity,
    height: 40,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(64, 135, 255, 1), blurRadius: 5)
        ]),
    child: CustomTitle(
      text: option,
      fontSize: 18,
      bold: true,
      color: Colors.black,
    ),
  );
}

//Widget de Etapas del Quiz

class CircleStep extends StatelessWidget {
  const CircleStep({Key? key, required this.step}) : super(key: key);
  final String step;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Colors.white, width: 2)),
      child: Center(
          child: CustomText(
        text: step,
        bold: true,
        fontSize: 20,
        color: Colors.white,
      )),
    );
  }
}
