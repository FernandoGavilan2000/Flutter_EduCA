import 'package:flutter/material.dart';
import 'package:flutter_educa/providers/Course.dart';
import 'package:flutter_educa/providers/User.dart';
import 'package:flutter_educa/utils/courses.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import 'package:provider/provider.dart';

class MenuNavBar extends StatelessWidget {
  const MenuNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userImage = Provider.of<UserProvider>(context).userImage;
    String firstName = Provider.of<UserProvider>(context).firstName;
    String userEmail = Provider.of<UserProvider>(context).userEmail;

    void linkCourse(String courseName, String coursePath, List<String> goals) {
      Provider.of<CourseProvider>(context, listen: false)
          .changeCourse(courseName, coursePath, goals);
      Navigator.of(context).pushNamed('/course');
    }

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
                      'https://firebasestorage.googleapis.com/v0/b/educa-app-6f86a.appspot.com/o/assets%2FBanner.png?alt=media&token=cebdf895-2324-4603-a91b-ec8e969e068f')),
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
              onTap: () {
                linkCourse(
                    coursesMap.keys.elementAt(0),
                    coursesMap.values.elementAt(0)['api_path'],
                    coursesMap.values.elementAt(0)['goals']);
              }),
          ListTile(
            leading: const Icon(Icons.layers_outlined),
            title: const CustomSubTitle(
              text: 'Matemáticas',
              fontSize: 15,
              align: TextAlign.left,
              bold: true,
            ),
            onTap: () {
              linkCourse(
                  coursesMap.keys.elementAt(1),
                  coursesMap.values.elementAt(1)['api_path'],
                  coursesMap.values.elementAt(1)['goals']);
            },
          ),
          ListTile(
            leading: const Icon(Icons.layers_outlined),
            title: const CustomSubTitle(
              text: 'Ingles',
              fontSize: 15,
              align: TextAlign.left,
              bold: true,
            ),
            onTap: () {
              linkCourse(
                  coursesMap.keys.elementAt(2),
                  coursesMap.values.elementAt(2)['api_path'],
                  coursesMap.values.elementAt(2)['goals']);
            },
          ),
          ListTile(
              leading: const Icon(Icons.layers_outlined),
              title: const CustomSubTitle(
                text: 'Sociales',
                fontSize: 15,
                align: TextAlign.left,
                bold: true,
              ),
              onTap: () {
                linkCourse(
                    coursesMap.keys.elementAt(3),
                    coursesMap.values.elementAt(3)['api_path'],
                    coursesMap.values.elementAt(3)['goals']);
              }),
          ListTile(
            leading: const Icon(Icons.login_outlined),
            title: const CustomSubTitle(
              text: 'Salir',
              fontSize: 15,
              align: TextAlign.left,
              bold: true,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
