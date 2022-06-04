import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/CardNewRecord.dart';
import 'package:flutter_educa/widgets/CategoriesScroller.dart';
import 'package:flutter_educa/widgets/HeaderCard.dart';
import 'package:flutter_educa/widgets/MenuNavBar.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import 'package:flutter_educa/widgets/Text/CustomText.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MenuNavBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const HeaderCard(
                educaColor: Colors.black,
                messageColor: Colors.black,
                message: false,
                imageSize: 78,
              ),
              Row(
                children: const [
                  CustomSubTitle(text: '!Hola '),
                  CustomSubTitle(
                    text: 'Fernando!',
                    bold: true,
                    fontSize: 27,
                  ),
                ],
              ),
              const CustomSubTitle(
                text: 'Talento EduCA',
                fontSize: 18,
              ),
              const SizedBox(height: 45),
              const CustomText(
                text: 'Empecemos con:',
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
                subtitle: 'Aprendiste las reglas basicas de las matematicas',
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
    );
  }
}
