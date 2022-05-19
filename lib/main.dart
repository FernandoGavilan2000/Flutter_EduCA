import 'package:flutter/material.dart';
import 'package:flutter_educa/providers/Course.dart';
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
        ChangeNotifierProvider(create: (context) => CourseProvider())
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
