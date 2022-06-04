import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Buttons/LargeButton.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(69, 84, 255, 1),
        Color.fromRGBO(61, 168, 255, 1)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomSubTitle(
                  text: 'Bienvenido',
                  fontSize: 40,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomSubTitle(
                      text: 'al ',
                      fontSize: 40,
                      color: Colors.white,
                    ),
                    CustomTitle(
                      text: 'Aprendizaje',
                      bold: true,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(50),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Image.asset('assets/avatar_boy.png')),
                        const SizedBox(width: 20),
                        Expanded(child: Image.asset('assets/avatar_dog.png')),
                        const SizedBox(width: 20),
                        Expanded(child: Image.asset('assets/avatar_girl.png'))
                      ]),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: const LargeButton(title: 'Ingresar'),
                )
              ],
            ),
          ),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/LoginBackground.png'))),
        ),
      ),
    );
  }
}
