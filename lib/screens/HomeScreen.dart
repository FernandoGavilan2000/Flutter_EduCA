import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/CardNewRecord.dart';
import 'package:flutter_educa/widgets/CategoriesScroller.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import 'package:flutter_educa/widgets/Text/CustomText.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> listCourses = [
      'Mate 1',
      'Historia del Peru',
      'Ciencias'
    ];
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
                    Row(
                      children: const [
                        CustomSubTitle(text: '!Hola '),
                        CustomSubTitle(
                          text: 'Fernando!',
                          bold: true,
                          fontSize: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    const CustomText(
                      text: 'Cursos en proceso',
                      bold: true,
                    ),
                    const CategoriesScroller(),
                    const CustomText(
                      text: 'Logros',
                      bold: true,
                    ),
                    const SizedBox(height: 30),
                    const CardNewRecord(
                      title: 'Matematica 1',
                      subtitle:
                          'Aprendiste las reglas basicas de las matematicas',
                    ),
                    const CardNewRecord(
                      title: 'Historia del Perú',
                      subtitle: 'Conocimos la historia de los Incas...',
                    ),
                    const CardNewRecord(
                      title: 'Ciencias',
                      subtitle: 'Aprendiste las diferentes reacciones que...',
                    ),
                    const CardNewRecord(
                      title: 'Ciencias',
                      subtitle: 'Aprendiste las diferentes reacciones que...',
                    ),
                    const CardNewRecord(
                      title: 'Ciencias',
                      subtitle: 'Aprendiste las diferentes reacciones que...',
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
