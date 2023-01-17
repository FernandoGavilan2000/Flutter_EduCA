import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_educa/providers/Course.dart';
import 'package:flutter_educa/providers/User.dart';
import 'package:flutter_educa/route_generator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(
            create: (context) => UserProvider(
                userID: 'CcGSgbhm2YWFIwiByEZU',
                firstName: 'Fernando',
                lastName: 'Gavilan Hernandez',
                userBirthday: '16/12/2000',
                userImage:
                    'https://firebasestorage.googleapis.com/v0/b/educa-app-6f86a.appspot.com/o/assets%2FPhotoPerfil.png?alt=media&token=74ffd5dd-7481-40c5-90e2-7e87ba9befda',
                userAddress: 'Urb.Los Rosales A-56',
                userCity: 'Ica-Peru',
                userEmail: '20171720@unica.edu.pe'))
      ],
      child: const MaterialApp(
        title: 'EduCA',
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
