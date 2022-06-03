import 'package:flutter/material.dart';
import 'package:flutter_educa/providers/Course.dart';
import 'package:flutter_educa/providers/User.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import 'package:provider/provider.dart';

class MenuNavBar extends StatelessWidget {
  const MenuNavBar({Key? key}) : super(key: key);

  static Map<String, Map<String, dynamic>> courses = {
    'Comunicación': {
      'api_path': 'comunicacion',
      'goals': [
        'Comunicar oralmente en su lengua materna.',
        'Leer diversos tipos de textos escritos en su lengua materna.',
        'Escribir diversos tipos de textos en su lengua materna.'
      ]
    },
    'Ingles': {
      'api_path': 'ingles',
      'goals': [
        'Comunicar oralmente en su lengua materna.',
        'Leer diversos tipos de textos escritos en su lengua materna.',
        'Escribir diversos tipos de textos en su lengua materna.'
      ]
    },
    'Matemáticas': {
      'api_path': 'matematicas',
      'goals': [
        'Comunicar oralmente en su lengua materna.',
        'Leer diversos tipos de textos escritos en su lengua materna.',
        'Escribir diversos tipos de textos en su lengua materna.'
      ]
    },
    'Sociales': {
      'api_path': 'sociales',
      'goals': [
        'Comunicar oralmente en su lengua materna.',
        'Leer diversos tipos de textos escritos en su lengua materna.',
        'Escribir diversos tipos de textos en su lengua materna.'
      ]
    },
  };

  @override
  Widget build(BuildContext context) {
    String userImage = Provider.of<UserProvider>(context).userImage;
    String firstName = Provider.of<UserProvider>(context).firstName;
    String userEmail = Provider.of<UserProvider>(context).userEmail;
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: CustomSubTitle(
              text: firstName,
              fontSize: 18,
              color: Colors.white,
              bold: true,
            ),
            accountEmail: CustomSubTitle(
              text: userEmail,
              color: Colors.white,
              fontSize: 14,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.network(
                  userImage,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/api-hackunica.appspot.com/o/fotos%2Fwave-ultimate.png?alt=media&token=943364ec-1ec4-490f-93b7-f361768b870b')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const CustomSubTitle(
              text: 'Home',
              fontSize: 15,
              align: TextAlign.left,
              bold: true,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const CustomSubTitle(
              text: 'Perfil',
              fontSize: 15,
              align: TextAlign.left,
              bold: true,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/profile');
            },
          ),
          ListTile(
              leading: const Icon(Icons.layers_outlined),
              title: const CustomSubTitle(
                text: 'Comunicación',
                fontSize: 15,
                align: TextAlign.left,
                bold: true,
              ),
              onTap: () {}),
          ListTile(
            leading: const Icon(Icons.layers_outlined),
            title: const CustomSubTitle(
              text: 'Matemáticas',
              fontSize: 15,
              align: TextAlign.left,
              bold: true,
            ),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.layers_outlined),
            title: const CustomSubTitle(
              text: 'Ingles',
              fontSize: 15,
              align: TextAlign.left,
              bold: true,
            ),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.layers_outlined),
            title: const CustomSubTitle(
              text: 'Sociales',
              fontSize: 15,
              align: TextAlign.left,
              bold: true,
            ),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.login_outlined),
            title: const CustomSubTitle(
              text: 'Salir',
              fontSize: 15,
              align: TextAlign.left,
              bold: true,
            ),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
