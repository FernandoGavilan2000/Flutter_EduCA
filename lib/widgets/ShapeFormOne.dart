import 'package:flutter/material.dart';

class ShapeOne extends StatelessWidget {
  const ShapeOne({Key? key, required this.size}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(-10.0, 0.0),
      children: [
        SizedBox(
          child: Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(67, 101, 255, 1), shape: BoxShape.circle),
          ),
        ),
        SizedBox(
          child: Container(
            width: size + (size * 0.10),
            height: size + (size * 0.10),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(61, 168, 255, 0.7083),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        )
      ],
    );
  }
}
