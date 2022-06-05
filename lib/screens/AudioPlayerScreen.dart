import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';

class AudioPlayerScreen extends StatelessWidget {
  final Map data;
  const AudioPlayerScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 800,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Colors.black,
          Color.fromARGB(141, 65, 63, 63),
        ], begin: Alignment.bottomCenter, end: Alignment.center),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/girl.png'),
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTitle(
                      text: data['title'],
                      fontSize: 32,
                      bold: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTitle(
                      text: data['descrip'],
                      fontSize: 14,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                width: double.infinity,
                height: 100,
                child: Image.asset(
                  'assets/Media.png',
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
