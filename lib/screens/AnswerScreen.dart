import 'package:flutter/material.dart';
import 'package:flutter_educa/models/quizzquestions.dart';
import 'package:flutter_educa/providers/Course.dart';
import 'package:flutter_educa/services/remote_service.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import 'package:flutter_educa/widgets/Text/CustomText.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AnswerScreen extends StatefulWidget {
  final String quizzID;
  final String coursePath;
  const AnswerScreen(
      {Key? key, required this.quizzID, required this.coursePath})
      : super(key: key);

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  late String coursePath = widget.coursePath;
  late String quizzID = widget.quizzID;
  List<QuizzQuestions>? questions;
  var isLoaded = false;
  var index = 0;
  @override
  void initState() {
    super.initState();
    //Fetch Data Questions
    getQuestionsAPI();
  }

  void prevQuestion() {}

  void nextQuestion() {}

  getQuestionsAPI() async {
    questions = await RemoteService().getQuestions(coursePath, quizzID);
    if (questions != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (questions != null) {
      return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            FloatingActionButton(
              child: const Icon(Icons.navigate_before_rounded),
              onPressed: prevQuestion,
            ),
            FloatingActionButton(
              child: const Icon(Icons.navigate_next_rounded),
              onPressed: nextQuestion,
            )
          ]),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Color.fromRGBO(69, 84, 255, 1),
                Color.fromRGBO(61, 168, 255, 1)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Visibility(
              visible: isLoaded,
              replacement: const Center(
                  child: CircularProgressIndicator(
                color: Color.fromRGBO(69, 84, 255, 1),
              )),
              child: QuizContent(
                  question: questions![index],
                  index: index,
                  prevQuestion: prevQuestion,
                  nextQuestion: nextQuestion),
            ),
          ));
    } else {
      return Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            Color.fromRGBO(69, 84, 255, 1),
            Color.fromRGBO(61, 168, 255, 1)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ));
    }
  }
}

class QuizContent extends StatelessWidget {
  final QuizzQuestions question;
  final Function prevQuestion;
  final Function nextQuestion;
  final int index;
  const QuizContent(
      {Key? key,
      required this.question,
      required this.prevQuestion,
      required this.nextQuestion,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String courseName = Provider.of<CourseProvider>(context).courseName;

    return Column(
      children: [
        Expanded(
          flex: 14,
          child: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CustomSubTitle(
                    text: courseName,
                    color: Colors.white,
                    bold: true,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleStep(step: '1'),
                CircleStep(step: '2'),
                CircleStep(step: '3'),
                CircleStep(step: '4'),
                CircleStep(step: '5'),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 78,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
              padding: const EdgeInsets.all(28),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${index + 1}.",
                    bold: true,
                    color: Colors.black,
                    fontSize: 45,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    question.titulo,
                    style: GoogleFonts.raleway(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Column(
                    children: listOptions(question.options), /////////////////
                  )
                ],
              ),
            )),
      ],
    );
  }
}

List<Widget> listOptions(List<String> options) {
  List<Widget> optionsUI = [];
  options.forEach((element) {
    print(element);
    optionsUI.add(option(element));
  });
  return optionsUI;
}

//Widget para las opciones
Widget option(String option) {
  return Container(
    width: double.infinity,
    height: 40,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(64, 135, 255, 1), blurRadius: 5)
        ]),
    child: CustomTitle(
      text: option,
      fontSize: 18,
      bold: true,
      color: Colors.black,
    ),
  );
}

//Widget de Etapas del Quiz

class CircleStep extends StatelessWidget {
  const CircleStep({Key? key, required this.step}) : super(key: key);
  final String step;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Colors.white, width: 2)),
      child: Center(
          child: CustomText(
        text: step,
        bold: true,
        fontSize: 20,
        color: Colors.white,
      )),
    );
  }
}
