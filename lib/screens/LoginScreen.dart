import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Buttons/MediumButton.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //String inputRecibido;
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
                      text: 'a Edu',
                      fontSize: 40,
                      color: Colors.white,
                    ),
                    CustomTitle(
                      text: 'CA',
                      bold: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                //------------------ Marcilla Inputs ------------------
                const InputField(text: 'UserName'),
                const SizedBox(
                  height: 20,
                ),
                const InputField(text: 'Password'),
                const SizedBox(
                  height: 60,
                ),

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

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: TextField(
        style:
            const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        cursorColor: const Color.fromARGB(255, 110, 59, 230),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 216, 206, 250)),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelText: text,
          filled: true,
          fillColor: Colors.white,
          // contentPadding: EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 216, 206, 250)),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
