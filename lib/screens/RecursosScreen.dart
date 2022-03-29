import 'package:flutter/material.dart';

import '../widgets/Text/CustomText.dart';
import '../widgets/Text/CustomTitle.dart';

class RecursosScreen extends StatelessWidget {
  const RecursosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.28;
    const double categoryWidth = 220;
    return SafeArea(
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/CourseBackground.png'))),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.transparent,
                        height: MediaQuery.of(context).size.height * 0.1,
                        //child: Text("AQUI VA EL MENU HAMBURGUESA + Photo"),
                      ),
                      Center(
                        child: Column(
                          children: const [
                            CustomTitle(
                              text: 'Recursos Disponibles',
                              color: Colors.black,
                              bold: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CardResource(
                                    categoryHeight: categoryHeight,
                                    categoryWidth: categoryWidth,
                                    resourceName: "Lecturas",
                                    pathImage: "assets/lec.png",
                                    colorFondo:
                                        const Color.fromRGBO(236, 232, 255, 1),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  CardResource(
                                    categoryHeight: categoryHeight,
                                    categoryWidth: categoryWidth,
                                    resourceName: "Quizes",
                                    pathImage: "assets/quizes.png",
                                    colorFondo:
                                        const Color.fromRGBO(210, 251, 221, 1),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CardResource(
                                    categoryHeight: categoryHeight,
                                    categoryWidth: categoryWidth,
                                    resourceName: "Audios",
                                    pathImage: "assets/audios.png",
                                    colorFondo:
                                        const Color.fromRGBO(254, 234, 232, 1),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  CardResource(
                                    categoryHeight: categoryHeight,
                                    categoryWidth: categoryWidth,
                                    resourceName: "Videos",
                                    pathImage: "assets/videos.png",
                                    colorFondo:
                                        const Color.fromRGBO(212, 239, 255, 1),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

class CardResource extends StatelessWidget {
  const CardResource({
    Key? key,
    required this.categoryHeight,
    required this.categoryWidth,
    required this.resourceName,
    required this.colorFondo,
    // required this.colorFondo,
    required this.pathImage,
  }) : super(key: key);

  final double categoryHeight;
  final double categoryWidth;
  final String resourceName;
  final Color colorFondo;
  // final String colorFondo;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (resourceName) {
          case "Quizes":
            Navigator.of(context).pushNamed('/quizes');
            break;
          case "Audios":
            Navigator.of(context).pushNamed('/audios');
            break;
          case "Lecturas":
            Navigator.of(context).pushNamed('/lecturas');
            break;
          case "Videos":
            Navigator.of(context).pushNamed('/videos');
            break;
          default:
            Navigator.of(context).pushNamed('/recursos');
            break;
        }
      },
      child: Container(
        width: 140,
        height: categoryHeight,
        margin: const EdgeInsets.only(),
        decoration: BoxDecoration(
            color: colorFondo,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15,
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(15.00))),
        child: Padding(
            padding: const EdgeInsets.only(top: 0, left: 0),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 75,
                  child: Container(
                      width: double.infinity,
                      height: 170,
                      decoration: BoxDecoration(
                          color: colorFondo,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.00),
                              topRight: Radius.circular(20.00))),
                      child: Image.asset('$pathImage')),
                ),
                Expanded(
                  flex: 25,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.00),
                            bottomRight: Radius.circular(20.00))),
                    child: Column(
                      children: [
                        CustomText(
                          text: resourceName,
                          fontSize: 20,
                          bold: true,
                        ),
                        const CustomText(
                          text: "12 Lecturas",
                          fontSize: 10,
                          bold: true,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
