import 'package:flutter/material.dart';
import 'package:flutter_educa/providers/Course.dart';
import 'package:flutter_educa/widgets/HeaderCard.dart';
import 'package:flutter_educa/widgets/MenuNavBar.dart';
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
                          Container(
                              width: widthScreen * 0.30,
                              height: widthScreen * 0.30,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 18, 127, 252))),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTitle(
                            text: courseName,
                            color: Colors.black,
                            bold: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    const CustomText(
                      text: 'Competencias:',
                      bold: true,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.all(widthScreen * 0.025),
                      child: Column(
                        children: listCompetencias(courseName, courseGoals),
                      ),
                    )
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
              background: const Color.fromARGB(255, 60, 221, 66)));
          break;
        case 1:
          listCards.add(CompetenciaCard(
            nameCourse: name,
            label: goals[i],
            background: const Color.fromARGB(255, 65, 107, 243),
          ));
          break;
        case 2:
          listCards.add(CompetenciaCard(
            nameCourse: name,
            label: goals[i],
            background: const Color.fromARGB(255, 241, 80, 68),
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
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
            color: background, borderRadius: BorderRadius.circular(12)),
        width: double.infinity,
        height: 100,
        child: Center(
          child: CustomSubTitle(
              align: TextAlign.left,
              bold: true,
              color: Colors.white,
              fontSize: 18,
              text: label),
        ),
      ),
    );
  }
}
