import 'package:flutter/material.dart';

import '../widgets/Text/CustomText.dart';
import '../widgets/Text/CustomTitle.dart';

class RecursosScreen extends StatelessWidget {
  const RecursosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.28;
    final double categoryWidth = MediaQuery.of(context).size.width * 0.40;
    final double space = MediaQuery.of(context).size.width * 0.06;
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
                  margin: EdgeInsets.all(space),
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
                        height: 25,
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
                                    colorImage: const Color.fromARGB(
                                        255, 159, 144, 235),
                                    colorFondo:
                                        const Color.fromRGBO(236, 232, 255, 1),
                                  ),
                                  SizedBox(
                                    width: space,
                                  ),
                                  CardResource(
                                    categoryHeight: categoryHeight,
                                    categoryWidth: categoryWidth,
                                    resourceName: "Quizes",
                                    pathImage: "assets/quizes.png",
                                    colorImage: const Color.fromARGB(
                                        255, 143, 238, 168),
                                    colorFondo:
                                        const Color.fromRGBO(210, 251, 221, 1),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CardResource(
                                    categoryHeight: categoryHeight,
                                    categoryWidth: categoryWidth,
                                    resourceName: "Audios",
                                    pathImage: "assets/audios.png",
                                    colorImage: const Color.fromARGB(
                                        255, 241, 184, 179),
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
                                    colorImage: const Color.fromARGB(
                                        255, 167, 214, 241),
                                    colorFondo:
                                        const Color.fromRGBO(212, 239, 255, 1),
                                  )
                                ],
                              ),
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
    required this.colorImage,
    required this.pathImage,
  }) : super(key: key);

  final double categoryHeight;
  final double categoryWidth;
  final String resourceName;
  final Color colorFondo;
  final Color colorImage;
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
        constraints: const BoxConstraints(minWidth: 100, maxWidth: 160),
        width: categoryWidth,
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
                  flex: 70,
                  child: Container(
                      padding: const EdgeInsets.all(22),
                      width: double.infinity,
                      height: 170,
                      decoration: BoxDecoration(
                          color: colorFondo,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.00),
                              topRight: Radius.circular(20.00))),
                      child: CircleAvatar(
                          backgroundColor: colorImage,
                          child: Image.asset('$pathImage'))),
                ),
                Expanded(
                  flex: 30,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.00),
                            bottomRight: Radius.circular(20.00))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: resourceName,
                          fontSize: 24,
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
