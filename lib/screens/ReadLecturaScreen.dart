import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';

class ReadLecturaScreen extends StatelessWidget {
  const ReadLecturaScreen({Key? key, required this.data}) : super(key: key);
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                child: Image.network(
                  data['image'],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 18),
                width: double.infinity,
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.55),
                decoration: const BoxDecoration(color: Colors.black87),
                child: Column(children: [
                  CustomTitle(
                    text: data['title'],
                    bold: true,
                    fontSize: 27,
                  ),

                  /*
                  CustomTitle(
                    text: 'ABRAHAM VALDELOMAR',
                    bold: false,
                    fontSize: 15,
                  ),
                  */
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    data['text'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, height: 1.5),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
