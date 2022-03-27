import 'package:flutter/material.dart';

import '../widgets/Text/CustomTitle.dart';

class RecursosScreen extends StatelessWidget {
  const RecursosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/CourseBackground.png'))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height * 0.1,
                      //child: Text("AQUI VA EL MENU HAMBURGUESA + Photo"),
                    ),
                    Center(
                      child: Column(
                        children: const [
                          CustomTitle(
                            text: 'Recursos Disponibles',
                            color: Colors.black,
                            bold: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GridView.count(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      crossAxisCount: 2,
                      children: [],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
