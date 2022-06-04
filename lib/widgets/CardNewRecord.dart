import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/ShapeFormOne.dart';

import 'Text/CustomText.dart';

class CardNewRecord extends StatelessWidget {
  const CardNewRecord({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      margin: const EdgeInsets.only(bottom: 20),
      //decoration: BoxDecoration(color: Colors.red),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
              color: HexColor('D7E6FF'),
              borderRadius: BorderRadius.circular(7)),
          child: const CircleShapeTwo(
              size: 25,
              firstColor: '4365FF',
              secondColor: '67C8FF',
              opacitySecondColor: 0.8051),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  bold: true,
                  fontSize: 16,
                ),
                CustomText(
                  text: subtitle,
                  fontSize: 13,
                )
              ],
            ),
          ),
        ),
        Image.asset(
          'assets/trophy.png',
          width: 39,
          height: 39,
        )
      ]),
    );
  }
}
