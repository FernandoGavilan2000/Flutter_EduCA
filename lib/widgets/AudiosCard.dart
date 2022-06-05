import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';

class AudiosCard extends StatelessWidget {
  const AudiosCard({
    Key? key,
    this.pressedCourse = false,
    required this.titleText,
    required this.description,
  }) : super(key: key);

  final String titleText;
  final String description;
  final bool pressedCourse;
  @override
  Widget build(BuildContext context) {
    const Color colorBlue = Color.fromRGBO(64, 135, 255, 1);
    const Color colorNegro = Colors.black;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      height: 60,
      //decoration: const BoxDecoration(color: Color.fromARGB(255, 35, 218, 96)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            flex: 10,
            child: CircleAvatar(
              backgroundColor: colorBlue,
              radius: 8,
            ),
          ),
          Expanded(
            flex: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTitle(
                  text: titleText,
                  color: colorBlue,
                  fontSize: 15,
                ),
                CustomSubTitle(
                  text: description,
                  color: colorNegro,
                  fontSize: 10,
                )
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              child: InkWell(
                onTap: () {
                  Map<String, String> data = {
                    'title': titleText,
                    'descrip': description,
                  };
                  Navigator.of(context)
                      .pushNamed('/audio_demo', arguments: data);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.play_arrow,
                      color: Color.fromARGB(255, 43, 43, 43),
                    ),
                    CustomSubTitle(
                      text: 'Play',
                      color: colorNegro,
                      fontSize: 9,
                      bold: true,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
