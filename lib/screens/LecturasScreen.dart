import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';

import '../widgets/Text/CustomText.dart';
import '../widgets/Text/CustomTitle.dart';

class LecturasScreen extends StatelessWidget {
  const LecturasScreen({Key? key}) : super(key: key);

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
                        CustomText(
                          text: '¡Conozcamos ',
                        ),
                        CustomText(
                          text: 'mucho mas!',
                          bold: true,
                        ),
                      ],
                    ),
                    const CustomSubTitle(
                      color: Color.fromRGBO(69, 84, 255, 1),
                      text: 'Lecturas',
                      fontSize: 35,
                      bold: true,
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
