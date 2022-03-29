import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';

import '../widgets/Text/CustomText.dart';
import '../widgets/Text/CustomTitle.dart';

class AudiosScreen extends StatelessWidget {
  const AudiosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(69, 84, 255, 1),
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/whiteVector.png'))),
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
                    const CustomSubTitle(
                      text: '¡Escuchemos más!',
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    const CustomSubTitle(
                      color: Colors.white,
                      text: 'Audios',
                      bold: true,
                      fontSize: 40,
                    ),
                    const SizedBox(height: 20),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
