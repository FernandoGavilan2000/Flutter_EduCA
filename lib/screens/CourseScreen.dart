import 'package:flutter/material.dart';

import '../widgets/Text/CustomSubTitle.dart';
import '../widgets/Text/CustomText.dart';
import '../widgets/Text/CustomTitle.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  Widget build(BuildContext context) {
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
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
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
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: MediaQuery.of(context).size.width * 0.30,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 18, 127, 252))),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTitle(
                            text: data['nameCourse'],
                            color: Colors.black,
                            bold: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    const CustomText(
                      text: 'Competencias',
                      bold: true,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children:
                          listCompetencias(data['nameCourse'], data['goals']),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> listCompetencias(String name, List goals) {
  List<Widget> listCards = [];
  for (var i = 0; i < goals.length; i++) {
    switch (i) {
      case 0:
        listCards.add(CompetenciaCard(
            nameCourse: name,
            label: goals[i],
            background: Color.fromARGB(255, 53, 221, 59)));
        break;
      case 1:
        listCards.add(CompetenciaCard(
          nameCourse: name,
          label: goals[i],
          background: Color.fromARGB(255, 66, 108, 245),
        ));
        break;
      case 2:
        listCards.add(CompetenciaCard(
          nameCourse: name,
          label: goals[i],
          background: Color.fromARGB(255, 255, 104, 93),
        ));
        break;
      case 3:
        listCards.add(CompetenciaCard(
          nameCourse: name,
          label: goals[i],
          background: Color.fromARGB(255, 247, 170, 55),
        ));
        break;
      default:
        listCards.add(CompetenciaCard(
          nameCourse: name,
          label: goals[i],
          background: Color.fromARGB(255, 66, 108, 245),
        ));
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
        Navigator.of(context)
            .pushNamed('/recursos', arguments: {'nameCourse': nameCourse});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
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
              fontSize: 20,
              text: label),
        ),
      ),
    );
  }
}
