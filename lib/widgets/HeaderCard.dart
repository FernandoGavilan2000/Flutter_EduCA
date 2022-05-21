import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Text/CustomText.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard(
      {Key? key,
      this.message = false,
      this.educaColor = Colors.white,
      this.imageSize = 65,
      this.messageColor = Colors.black})
      : super(key: key);
  final bool message;
  final double imageSize;
  final Color educaColor;
  final Color messageColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //Contenedor principal
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              //Menu y Titulo de la App
              Expanded(
                flex: 50,
                child: SizedBox(
                  width: double.infinity,
                  child: Row(children: [
                    Icon(
                      Icons.menu,
                      color: educaColor,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: "Edu",
                          color: educaColor,
                        ),
                        CustomText(
                          text: "CA",
                          bold: true,
                          color: educaColor,
                        ),
                      ],
                    )
                  ]),
                ),
              ),
              //Profile avatar and ...
              Expanded(
                flex: 50,
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          message ? "¡Mejoremos tus habilidades Fernando!" : "",
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.raleway(
                            color: messageColor,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                          width: imageSize,
                          height: imageSize,
                          child: const CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://images.clipartlogo.com/files/istock/previews/1062/106268237-study-to-male-students.jpg"),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //contenedor de los textos
        // const TitleCourse(),
      ],
    );
  }
}
