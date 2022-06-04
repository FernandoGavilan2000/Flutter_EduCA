import 'package:flutter/material.dart';
import 'package:flutter_educa/providers/Course.dart';
import 'package:flutter_educa/widgets/HeaderCard.dart';
import 'package:flutter_educa/widgets/MenuNavBar.dart';
import 'package:flutter_educa/widgets/ShapeFormOne.dart';
import 'package:provider/provider.dart';

import '../widgets/Text/CustomText.dart';
import '../widgets/Text/CustomTitle.dart';

class RecursosScreen extends StatelessWidget {
  const RecursosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.28;
    final double categoryWidth = MediaQuery.of(context).size.width * 0.40;
    final double space = MediaQuery.of(context).size.width * 0.06;

    String courseName = Provider.of<CourseProvider>(context).courseName;
    String coursePath = Provider.of<CourseProvider>(context).coursePath;
    return SafeArea(
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/CourseBackground.png'))),
            child: Scaffold(
              drawer: const MenuNavBar(),
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeaderCard(
                        educaColor: Colors.white,
                        messageColor: Colors.black,
                        message: true,
                      ),
                      Center(
                        child: CustomTitle(
                          text: courseName,
                          bold: true,
                          fontSize: 35,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      const CustomTitle(
                        text: 'Recursos:',
                        color: Colors.black,
                        bold: false,
                        fontSize: 22,
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
                                    course: coursePath,
                                    categoryHeight: categoryHeight,
                                    categoryWidth: categoryWidth,
                                    resourceName: "Lecturas",
                                    pathImage: "assets/lec.png",
                                    colorImage: HexColor('C0B3FF'),
                                    colorFondo: HexColor('ECE8FF'),
                                  ),
                                  SizedBox(
                                    width: space,
                                  ),
                                  CardResource(
                                    course: coursePath,
                                    categoryHeight: categoryHeight,
                                    categoryWidth: categoryWidth,
                                    resourceName: "Quizzes",
                                    pathImage: "assets/quizes.png",
                                    colorImage: HexColor('9FF5B6'),
                                    colorFondo: HexColor('D2FBDD'),
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
                                    course: coursePath,
                                    categoryHeight: categoryHeight,
                                    categoryWidth: categoryWidth,
                                    resourceName: "Audios",
                                    pathImage: "assets/audios.png",
                                    colorImage: HexColor('FEC8C3'),
                                    colorFondo: HexColor('FEEAE8'),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  CardResource(
                                    course: coursePath,
                                    categoryHeight: categoryHeight,
                                    categoryWidth: categoryWidth,
                                    resourceName: "Videos",
                                    pathImage: "assets/videos.png",
                                    colorImage: HexColor('78CDFF'),
                                    colorFondo: HexColor('D4EFFF'),
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
    required this.course,
  }) : super(key: key);

  final double categoryHeight;
  final double categoryWidth;
  final String resourceName;
  final Color colorFondo;
  final Color colorImage;
  final String pathImage;
  final String course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (resourceName) {
          case "Quizzes":
            Navigator.of(context).pushNamed('/quizzes', arguments: course);
            break;
          case "Audios":
            Navigator.of(context).pushNamed('/audios');
            break;
          case "Lecturas":
            Navigator.of(context).pushNamed('/lecturas', arguments: course);
            break;
          case "Videos":
            Navigator.of(context).pushNamed('/videos', arguments: course);
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
                          fontSize: 21,
                          bold: true,
                        ),
                        CustomText(
                          text: "12 ${resourceName}",
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
