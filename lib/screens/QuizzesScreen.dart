import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/QuizessScroller.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import '../widgets/Text/CustomText.dart';
//import '../widgets/Text/CustomTitle.dart';

class QuizzesScreen extends StatelessWidget {
  final String course;
  const QuizzesScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/blueVector.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            //,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    // decoration: const BoxDecoration(
                    //     color: Color.fromRGBO(38, 36, 196, 0.471)),
                    width: double.infinity,
                    height: 800,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 30,
                          child: Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.07),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  color: Colors.transparent,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  //child: Text("AQUI VA EL MENU HAMBURGUESA + Photo"),
                                ),
                                Row(
                                  children: const [
                                    CustomText(
                                      fontSize: 25,
                                      text: '¡Resolvamos ',
                                    ),
                                    CustomText(
                                      text: 'juntos!',
                                      fontSize: 25,
                                      bold: true,
                                    ),
                                  ],
                                ),
                                const CustomSubTitle(
                                  color: Color.fromRGBO(69, 84, 255, 1),
                                  text: 'Quizzes',
                                  fontSize: 35,
                                  bold: true,
                                ),
                                // const SizedBox(height: 05),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 70,
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(224, 235, 255, 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(60)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      blurRadius: 15)
                                ]),
                            child: QuizesScroller(course: course),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    ));
  }
}
