import 'package:flutter/material.dart';
import 'package:flutter_educa/models/quizzinfo.dart';
import 'package:flutter_educa/services/remote_service.dart';
import 'package:flutter_educa/widgets/QuizesCard.dart';

class QuizesScroller extends StatefulWidget {
  final String course;
  const QuizesScroller({Key? key, required this.course}) : super(key: key);

  @override
  State<QuizesScroller> createState() => _QuizesScrollerState();
}

class _QuizesScrollerState extends State<QuizesScroller> {
  List<QuizzInfo>? quizzes;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getQuizzesAPI();
  }

  getQuizzesAPI() async {
    quizzes = await RemoteService().getQuizzes(widget.course);
    if (quizzes != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
          child: CircularProgressIndicator(
        color: Color.fromRGBO(67, 101, 255, 1),
      )),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(234, 235, 255, 1),
          ),
          child: Column(
            children: listQuizzes(quizzes, widget.course),
          ),
        ),
      ),
    );
  }
}

List<QuizesCard> listQuizzes(List<QuizzInfo>? quizzes, String coursePath) {
  List<QuizesCard> list_quizzes = [];
  if (quizzes != null) {
    for (var item in quizzes) {
      list_quizzes.add(QuizesCard(
        coloFondo: const Color.fromRGBO(67, 101, 255, 1),
        description: item.about,
        title: item.titulo,
        sizeTitle: 20,
        quizzID: item.id,
        coursePath: coursePath,
      ));
    }
  }
  return list_quizzes;
}
