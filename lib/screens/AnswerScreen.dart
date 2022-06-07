import 'package:flutter/material.dart';
import 'package:flutter_educa/models/quizzquestions.dart';
import 'package:flutter_educa/providers/Course.dart';
import 'package:flutter_educa/services/remote_service.dart';
import 'package:flutter_educa/widgets/Alerts/AnswerMessage.dart';
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
  bool showButton = false;
  List<int> answersheet = [];
  int index = 0;

  @override
  void initState() {
    super.initState();
    //Fetch Data Questions
    getQuestionsAPI();
  }

  void prevQuestion() {
    if (!(index <= 0)) {
      setState(() {
        index--;
      });
    }
  }

  void checkAnswers() {
    int counter = 0;
    answersheet.asMap().forEach((key, value) {
      if (questions![key].index == value) {
        counter++;
      }
    });
    int points = counter * 10;
    //print(counter);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AnswerMessage(
            counter: counter,
            points: points,
          );
        });
  }

  void nextQuestion() {
    if (!(index == questions!.length - 1)) {
      setState(() {
        index++;
      });
    }
  }

  void chooseAnswer(int indexAnswer) {
    answersheet.insert(index, indexAnswer);
    answersheet.removeAt(index + 1);

    if (!(answersheet.asMap().containsValue(-1))) {
      showButton = true;
    }
    setState(() {});
  }

  getQuestionsAPI() async {
    questions = await RemoteService().getQuestions(coursePath, quizzID);
    if (questions != null) {
      setState(() {
        for (var i = 0; i < questions!.length; i++) {
          answersheet.add(-1);
        }
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
          floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    heroTag: "prevQuestion",
                    backgroundColor: const Color.fromRGBO(64, 135, 255, 1),
                    child: const Icon(Icons.navigate_before_rounded),
                    onPressed: prevQuestion,
                  ),
                  Visibility(
                    child: FloatingActionButton(
                      heroTag: "returnQuizzes",
                      backgroundColor: const Color.fromRGBO(64, 135, 255, 1),
                      child: const Icon(Icons.add_task),
                      onPressed: checkAnswers,
                    ),
                    visible: showButton,
                  ),
                  FloatingActionButton(
                    heroTag: "nextQuestion",
                    backgroundColor: const Color.fromRGBO(64, 135, 255, 1),
                    child: const Icon(Icons.navigate_next_rounded),
                    onPressed: nextQuestion,
                  )
                ]),
          ),
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
                  answersheet: answersheet,
                  index: index,
                  chooseAnswer: chooseAnswer,
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
        child: const Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      ));
    }
  }
}

class QuizContent extends StatelessWidget {
  final QuizzQuestions question;
  final Function prevQuestion;
  final Function nextQuestion;
  final List<int> answersheet;
  final Function chooseAnswer;
  final int index;
  const QuizContent(
      {Key? key,
      required this.question,
      required this.prevQuestion,
      required this.nextQuestion,
      required this.chooseAnswer,
      required this.answersheet,
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
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CustomSubTitle(
                    fontSize: 30,
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
              children: listSteps(answersheet, index),
            ),
          ),
        ),
        Expanded(
            flex: 78,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              padding: const EdgeInsets.all(28),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${index + 1}.",
                    bold: true,
                    color: Colors.black,
                    fontSize: 40,
                  ),
                  const SizedBox(
                    height: 15,
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
                    height: 30,
                  ),
                  Column(
                    children: listOptions(question.options, answersheet, index,
                        chooseAnswer), /////////////////
                  )
                ],
              ),
            )),
      ],
    );
  }
}

List<CircleStep> listSteps(List<int> answersheet, int index) {
  List<CircleStep> steps = [];
  answersheet.asMap().forEach((key, value) {
    if (answersheet[key] == -1) {
      steps.add(CircleStep(step: "${key + 1}", isMarked: false));
    } else {
      steps.add(CircleStep(step: "${key + 1}", isMarked: true));
    }
  });
  return steps;
}

List<Widget> listOptions(List<String> options, List<int> answerSheet, int index,
    Function chooseAnswer) {
  List<Widget> optionsUI = [];
  int markedIndexOption = -1;
  if (answerSheet.asMap().containsKey(index)) {
    markedIndexOption = answerSheet[index];
  }
  options.asMap().forEach((indexOption, value) {
    if (indexOption == markedIndexOption) {
      optionsUI.add(option(value, true, indexOption, chooseAnswer));
    } else {
      optionsUI.add(option(value, false, indexOption, chooseAnswer));
    }
  });

  return optionsUI;
}

//Widget para las opciones
Widget option(String option, bool isMarked, int index, Function callback) {
  return GestureDetector(
    onTap: () {
      callback(index);
    },
    child: Container(
      width: double.infinity,
      height: 42,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: isMarked ? Color.fromRGBO(64, 135, 255, 1) : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: const [
            BoxShadow(color: Color.fromRGBO(64, 135, 255, 1), blurRadius: 5)
          ]),
      child: CustomTitle(
        text: option,
        fontSize: 16,
        bold: true,
        color: isMarked ? Colors.white : Colors.black,
      ),
    ),
  );
}

//Widget de Etapas del Quiz

class CircleStep extends StatelessWidget {
  const CircleStep({Key? key, required this.step, required this.isMarked})
      : super(key: key);
  final String step;
  final bool isMarked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: isMarked ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Colors.white, width: 2)),
      child: Center(
        child: CustomText(
          text: step,
          bold: true,
          fontSize: 25,
          color: isMarked ? Color.fromRGBO(69, 84, 255, 1) : Colors.white,
        ),
      ),
    );
  }
}
