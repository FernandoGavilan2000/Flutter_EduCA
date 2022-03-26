import 'package:flutter/material.dart';

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
      height: 42,
      margin: const EdgeInsets.only(bottom: 20),
      //decoration: BoxDecoration(color: Colors.red),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.network(
            'https://toppng.com/uploads/preview/vector-triangle-11549968501firyzupx6o.png'),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                bold: true,
                fontSize: 17,
              ),
              CustomText(
                text: subtitle,
                fontSize: 14,
              )
            ],
          ),
        ),
        Image.asset('assets/trophy.png')
      ]),
    );
  }
}
