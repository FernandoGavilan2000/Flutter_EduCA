import 'package:flutter/material.dart';
import 'package:flutter_educa/providers/Course.dart';
import 'package:flutter_educa/widgets/HeaderCard.dart';
import 'package:flutter_educa/widgets/MenuNavBar.dart';
import 'package:flutter_educa/widgets/ShapeFormOne.dart';
import 'package:provider/provider.dart';

import '../widgets/Text/CustomSubTitle.dart';
import '../widgets/Text/CustomText.dart';
import '../widgets/Text/CustomTitle.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String courseName = Provider.of<CourseProvider>(context).courseName;
    List<String>? courseGoals = Provider.of<CourseProvider>(context).goals;
    double widthScreen = MediaQuery.of(context).size.width;
    //double heightScreen = MediaQuery.of(context).size.height;
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
              margin: EdgeInsets.all(widthScreen * 0.02),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderCard(
                      educaColor: Colors.white,
                      messageColor: Colors.black,
                      message: true,
                    ),
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTitle(
                            text: courseName,
                            color: Colors.black,
                            bold: true,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const CircleShapeOne(
                            size: 60,
                            firstColor: '4365FF',
                            secondColor: '3DA8FF',
                            opacitySecondColor: 0.7083,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    /* Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.all(9),
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(104, 160, 255, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: const CustomText(
                            text: "Competencias",
                            fontSize: 15,
                            color: Colors.white,
                            bold: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(118, 193, 255, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: const CustomText(
                            text: "Sesiones",
                            fontSize: 15,
                            color: Colors.white,
                            bold: true,
                          ),
                        ),
                      ],
                    ), */
                    //const SizedBox(height: 20),
                    const CustomSubTitle(
                      text: "!Desarrollemos una competencia juntos!",
                      bold: true,
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    Stack(
                      alignment: const Alignment(0.0, -1.5),
                      children: [
                        SizedBox(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: EdgeInsets.all(widthScreen * 0.025),
                              child: Row(
                                children:
                                    listCompetencias(courseName, courseGoals),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 95,
                          width: 95,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/avatar_dog.png'),
                          ),
                        ),
                      ],
                    ),
                    /* Container(
                      margin: EdgeInsets.all(widthScreen * 0.025),
                      child: Column(
                        children: listCompetencias(courseName, courseGoals),
                      ),
                    ), */
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> listCompetencias(String name, List<String>? goals) {
  List<Widget> listCards = [];
  if (goals != null) {
    for (var i = 0; i < goals.length; i++) {
      switch (i) {
        case 0:
          listCards.add(CompetenciaCard(
              nameCourse: name,
              label: goals[i],
              background: const Color.fromRGBO(104, 160, 255, 1)));
          break;
        case 1:
          listCards.add(CompetenciaCard(
            nameCourse: name,
            label: goals[i],
            background: const Color.fromRGBO(151, 130, 255, 1),
          ));
          break;
        case 2:
          listCards.add(CompetenciaCard(
            nameCourse: name,
            label: goals[i],
            background: const Color.fromRGBO(67, 101, 255, 1),
          ));
          break;
        case 3:
          listCards.add(CompetenciaCard(
            nameCourse: name,
            label: goals[i],
            background: const Color.fromARGB(255, 247, 170, 55),
          ));
          break;
        default:
          listCards.add(CompetenciaCard(
            nameCourse: name,
            label: goals[i],
            background: const Color.fromARGB(255, 66, 108, 245),
          ));
      }
    }
  }

  return listCards;
}

class CompetenciaCard extends StatelessWidget {
  const CompetenciaCard(
      {Key? key,
      required this.label,
      required this.nameCourse,
      this.background = Colors.blue})
      : super(key: key);

  final String label;
  final String nameCourse;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/recursos');
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        padding: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
            color: background, borderRadius: BorderRadius.circular(12)),
        width: 220,
        height: 280,
        child: Center(
          child: CustomSubTitle(
              align: TextAlign.center,
              bold: true,
              color: Colors.white,
              fontSize: 22,
              text: label),
        ),
      ),
    );
  }
}
