import 'package:flutter/material.dart';

class CircleShapeOne extends StatelessWidget {
  const CircleShapeOne({
    Key? key,
    required this.size,
    required this.firstColor,
    required this.secondColor,
    required this.opacitySecondColor,
  }) : super(key: key);
  final double size;
  final String firstColor;
  final String secondColor;
  final double opacitySecondColor;
  @override
  Widget build(BuildContext context) {
    Color secondaryColorp = HexColor(secondColor);
    return SizedBox(
      height: size + (size * 0.10),
      width: size + (size + (size * 0.10)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: (size - (size * 0.50)) / 3,
            child: Container(
              width: size + (size * 0.10),
              height: size + (size * 0.10),
              decoration: BoxDecoration(
                  color:
                      HexColor(firstColor), //Color.fromRGBO(67, 101, 255, 1),
                  shape: BoxShape.circle),
            ),
          ),
          Positioned(
            right: (size - (size * 0.50)) / 3,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(
                      secondaryColorp.red,
                      secondaryColorp.green,
                      secondaryColorp.blue,
                      opacitySecondColor),
                  shape: BoxShape.circle),
            ),
          )
        ],
      ),
    );
  }
}

class CircleShapeTwo extends StatelessWidget {
  const CircleShapeTwo({
    Key? key,
    required this.size,
    required this.firstColor,
    required this.secondColor,
    required this.opacitySecondColor,
  }) : super(key: key);
  final double size;
  final String firstColor;
  final String secondColor;
  final double opacitySecondColor;
  @override
  Widget build(BuildContext context) {
    Color secondaryColorp = HexColor(secondColor);
    return SizedBox(
      height: size,
      width: size + (size - (size * 0.5)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            left: (size - (size * 0.50)) / 4,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                  color:
                      HexColor(firstColor), //Color.fromRGBO(67, 101, 255, 1),
                  shape: BoxShape.circle),
            ),
          ),
          Positioned(
            bottom: 0,
            right: (size - (size * 0.50)) / 4,
            child: Container(
              width: size - (size * 0.50),
              height: size - (size * 0.50),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(
                      secondaryColorp.red,
                      secondaryColorp.green,
                      secondaryColorp.blue,
                      opacitySecondColor),
                  shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
