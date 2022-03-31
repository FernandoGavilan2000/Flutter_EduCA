import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';

import '../widgets/Text/CustomText.dart';
import '../widgets/Text/CustomTitle.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
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
                          text: '¡Aprendamos viendo!',
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        const CustomSubTitle(
                          color: Colors.white,
                          text: 'Videos',
                          bold: true,
                          fontSize: 40,
                        ),
                        const SizedBox(height: 20),
                      ]),
                ),
                Container(
                  width: double.infinity,
                  height: 900,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        CardVideo(
                            title: 'El Silabeo y sus caracteristicas',
                            thumbnail:
                                'https://firebasestorage.googleapis.com/v0/b/api-hackunica.appspot.com/o/assets%2Fminiaturas%2Fminiatura1.png?alt=media&token=e4e2efc9-bceb-4d4d-911b-a4e9c9e8ecff'),
                        CardVideo(
                            thumbnail:
                                'https://firebasestorage.googleapis.com/v0/b/api-hackunica.appspot.com/o/assets%2Fminiaturas%2Fminiatura2.png?alt=media&token=a654a314-83ae-4001-8058-c89890942d8c',
                            title: 'El acento ortográfico y prosódico'),
                        CardVideo(
                            thumbnail:
                                'https://firebasestorage.googleapis.com/v0/b/api-hackunica.appspot.com/o/assets%2Fminiaturas%2Fminiatura3.png?alt=media&token=ffb76386-afba-4ec6-8be2-a050196959af',
                            title: 'El pretérito pluscuamperfecto'),
                        CardVideo(
                            thumbnail:
                                'https://firebasestorage.googleapis.com/v0/b/api-hackunica.appspot.com/o/assets%2Fminiaturas%2Fminiatura2.png?alt=media&token=a654a314-83ae-4001-8058-c89890942d8c',
                            title: 'El acento ortográfico y prosódico II'),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardVideo extends StatelessWidget {
  const CardVideo({
    Key? key,
    required this.thumbnail,
    required this.title,
  }) : super(key: key);

  final String thumbnail;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(thumbnail)),
          borderRadius: BorderRadius.circular(20)),
      width: double.infinity,
      height: 200,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 40,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(69, 84, 255, 1),
            ),
          ),
          CustomSubTitle(
            fontSize: 17,
            text: title,
            color: Colors.white,
          )
        ],
      )),
    );
  }
}
