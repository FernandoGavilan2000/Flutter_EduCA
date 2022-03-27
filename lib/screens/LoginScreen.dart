import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Buttons/MediumButton.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(69, 84, 255, 1),
        Color.fromRGBO(61, 168, 255, 1)
      ], begin: Alignment.center, end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTitle(text: 'Bienvenido'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomTitle(text: 'a Edu'),
                    CustomTitle(
                      text: 'CA',
                      bold: true,
                    ),
                  ],
                ),
                //------------------ Marcilla Inputs ------------------
                const Text('Input UserName'),
                const Text('Input Password'),
                //------------------ Marcilla Inputs ------------------
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  child: const MediumButton(title: 'Ingresar'),
                )
              ],
            ),
          ),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/LoginBackground.png'))),
        ),
      ),
    );
  }
}
