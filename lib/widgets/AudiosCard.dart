import 'package:flutter/material.dart';
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
          Expanded(
            flex: 10,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                  color: colorBlue,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
          ),
          Expanded(
            flex: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTitle(
                  text: titleText,
                  color: colorBlue,
                  fontSize: 20,
                ),
                CustomTitle(
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
                  Navigator.of(context).pushNamed('/audio_demo');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.play_arrow,
                      color: Color.fromARGB(255, 43, 43, 43),
                    ),
                    CustomTitle(
                      text: 'Play',
                      color: colorNegro,
                      fontSize: 10,
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
