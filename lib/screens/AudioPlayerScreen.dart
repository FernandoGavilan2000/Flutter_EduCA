import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({Key? key}) : super(key: key);

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
          decoration: BoxDecoration(
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
                  children: const [
                    CustomTitle(
                      text: 'El Caballero Carmelo',
                      fontSize: 35,
                      bold: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTitle(
                      text: 'Un valiente gallito',
                      fontSize: 20,
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