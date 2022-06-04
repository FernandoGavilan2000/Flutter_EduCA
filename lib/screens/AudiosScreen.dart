import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/AudiosScroller.dart';
import 'package:flutter_educa/widgets/HeaderCard.dart';
import 'package:flutter_educa/widgets/MenuNavBar.dart';
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
          drawer: const MenuNavBar(),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: 850,
              //margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.02),
                              child: Column(children: const [
                                HeaderCard(
                                  educaColor: Colors.white,
                                  message: false,
                                  imageSize: 78,
                                ),
                                CustomSubTitle(
                                  text: '¡Escuchemos más!',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                CustomSubTitle(
                                  color: Colors.white,
                                  text: 'Audios',
                                  bold: true,
                                  fontSize: 45,
                                )
                              ]),
                            )
                          ],
                        )),
                    Expanded(
                      flex: 75,
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
                        child: const AudiosScroller(),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
