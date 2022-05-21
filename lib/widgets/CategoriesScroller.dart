import 'package:flutter/material.dart';
import 'package:flutter_educa/providers/Course.dart';
import 'package:provider/provider.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({Key? key}) : super(key: key);

  static Map<String, Map<String, dynamic>> courses = {
    'Comunicación': {
      'api_path': 'comunicacion',
      'goals': [
        'Comunicar oralmente en su lengua materna.',
        'Leer diversos tipos de textos escritos en su lengua materna.',
        'Escribir diversos tipos de textos en su lengua materna.'
      ]
    },
    'Ingles': {
      'api_path': 'ingles',
      'goals': [
        'Comunicar oralmente en su lengua materna.',
        'Leer diversos tipos de textos escritos en su lengua materna.',
        'Escribir diversos tipos de textos en su lengua materna.'
      ]
    },
    'Matemáticas': {
      'api_path': 'matematicas',
      'goals': [
        'Comunicar oralmente en su lengua materna.',
        'Leer diversos tipos de textos escritos en su lengua materna.',
        'Escribir diversos tipos de textos en su lengua materna.'
      ]
    },
    'Sociales': {
      'api_path': 'sociales',
      'goals': [
        'Comunicar oralmente en su lengua materna.',
        'Leer diversos tipos de textos escritos en su lengua materna.',
        'Escribir diversos tipos de textos en su lengua materna.'
      ]
    },
  };

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.35;
    const double categoryWidth = 240;
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                child: Row(
                    children:
                        listCourses(courses, categoryHeight, categoryWidth)))));
  }
}

List<Widget> listCourses(Map courses, double height, double width) {
  List<Widget> cardCourses = [];
  courses.forEach((key, value) {
    cardCourses.add(CardCourse(
      categoryHeight: height,
      categoryWidth: width,
      courseName: key,
      coursePath: value['api_path'],
      goals: value['goals'],
    ));
  });
  return cardCourses;
}

class CardCourse extends StatelessWidget {
  const CardCourse(
      {Key? key,
      required this.categoryHeight,
      required this.categoryWidth,
      required this.courseName,
      required this.goals,
      required this.coursePath})
      : super(key: key);

  final double categoryHeight;
  final double categoryWidth;
  final String courseName;
  final List<String> goals;
  final String coursePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<CourseProvider>(context, listen: false)
            .changeCourse(courseName, coursePath, goals);
        Navigator.of(context).pushNamed('/course');
      },
      child: Container(
        width: categoryWidth,
        margin: const EdgeInsets.only(right: 20),
        height: categoryHeight,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 210, 227, 255),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  courseName,
                  style: const TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 18, 127, 252)))
            ],
          ),
        ),
      ),
    );
  }
}
