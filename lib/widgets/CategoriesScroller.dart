import 'package:flutter/material.dart';
import 'package:flutter_educa/providers/Course.dart';
import 'package:flutter_educa/utils/courses.dart';
import 'package:flutter_educa/widgets/ShapeFormOne.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';
import 'package:provider/provider.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({Key? key}) : super(key: key);

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
                    children: listCourses(
                        coursesMap, categoryHeight, categoryWidth)))));
  }
}

List<Widget> listCourses(Map courses, double height, double width) {
  List<Widget> cardCourses = [];
  int i = 0;
  courses.forEach((key, value) {
    switch (i) {
      case 0:
        cardCourses.add(CardCourse(
          categoryHeight: height,
          categoryWidth: width,
          courseName: key,
          coursePath: value['api_path'],
          goals: value['goals'],
          firstColor: '4087FF',
          secondColor: '3DA8FF',
          opacitySecondColor: 0.7083,
        ));
        break;
      case 1:
        cardCourses.add(CardCourse(
          categoryHeight: height,
          categoryWidth: width,
          courseName: key,
          coursePath: value['api_path'],
          goals: value['goals'],
          firstColor: '4DB8CF',
          secondColor: '327DFD',
          opacitySecondColor: 0.7083,
        ));
        break;
      case 2:
        cardCourses.add(CardCourse(
          categoryHeight: height,
          categoryWidth: width,
          courseName: key,
          coursePath: value['api_path'],
          goals: value['goals'],
          firstColor: 'F85C5C',
          secondColor: '3DA8FF',
          opacitySecondColor: 0.7083,
        ));
        break;
      case 3:
        cardCourses.add(CardCourse(
          categoryHeight: height,
          categoryWidth: width,
          courseName: key,
          coursePath: value['api_path'],
          goals: value['goals'],
          firstColor: 'C2B5FF',
          secondColor: '327DFD',
          opacitySecondColor: 0.7083,
        ));
        break;

      default:
        cardCourses.add(CardCourse(
          categoryHeight: height,
          categoryWidth: width,
          courseName: key,
          coursePath: value['api_path'],
          goals: value['goals'],
          firstColor: '4087FF',
          secondColor: '3DA8FF',
          opacitySecondColor: 0.7083,
        ));
        break;
    }
    i++;
    /* cardCourses.add(CardCourse(
      categoryHeight: height,
      categoryWidth: width,
      courseName: key,
      coursePath: value['api_path'],
      goals: value['goals'],
    )); */
  });
  return cardCourses;
}

class CardCourse extends StatelessWidget {
  const CardCourse({
    Key? key,
    required this.categoryHeight,
    required this.categoryWidth,
    required this.courseName,
    required this.goals,
    required this.coursePath,
    required this.firstColor,
    required this.secondColor,
    required this.opacitySecondColor,
  }) : super(key: key);

  final double categoryHeight;
  final double categoryWidth;
  final String courseName;
  final List<String> goals;
  final String coursePath;
  final String firstColor;
  final String secondColor;
  final double opacitySecondColor;

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
                child: CustomTitle(
                  text: courseName,
                  bold: true,
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CircleShapeTwo(
                  size: 120,
                  firstColor: firstColor,
                  secondColor: secondColor,
                  opacitySecondColor: opacitySecondColor),
            ],
          ),
        ),
      ),
    );
  }
}
