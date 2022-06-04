import 'package:flutter/material.dart';
import 'package:flutter_educa/providers/User.dart';
import 'package:flutter_educa/widgets/Text/CustomText.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
    String userImage = Provider.of<UserProvider>(context).userImage;
    String firstName = Provider.of<UserProvider>(context).firstName;
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
                  child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
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
                          message
                              ? "¡Mejoremos tus habilidades ${firstName}!"
                              : "",
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.right,
                          style: GoogleFonts.raleway(
                            color: messageColor,
                            fontSize: 11,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/profile');
                        },
                        child: SizedBox(
                            width: imageSize,
                            height: imageSize,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(userImage),
                            )),
                      ),
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
