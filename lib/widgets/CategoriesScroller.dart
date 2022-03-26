import 'package:flutter/material.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.35;
    const double categoryWidth = 220;
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
                child: Row(children: <Widget>[
                  CardCourse(
                      categoryHeight: categoryHeight,
                      categoryWidth: categoryWidth,
                      courseName: "Comunicación"),
                  CardCourse(
                      categoryHeight: categoryHeight,
                      categoryWidth: categoryWidth,
                      courseName: "Ingles"),
                  CardCourse(
                      categoryHeight: categoryHeight,
                      categoryWidth: categoryWidth,
                      courseName: "Ciencias"),
                  CardCourse(
                      categoryHeight: categoryHeight,
                      categoryWidth: categoryWidth,
                      courseName: "Computación")
                ]))));
  }
}

class CardCourse extends StatelessWidget {
  const CardCourse({
    Key? key,
    required this.categoryHeight,
    required this.categoryWidth,
    required this.courseName,
  }) : super(key: key);

  final double categoryHeight;
  final double categoryWidth;
  final String courseName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 20),
      height: categoryHeight,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 210, 227, 255),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20),
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
              height: 20,
            ),
            Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 18, 127, 252))),
          ],
        ),
      ),
    );
  }
}
