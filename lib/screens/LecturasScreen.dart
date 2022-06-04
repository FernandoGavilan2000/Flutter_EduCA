import 'package:flutter/material.dart';
import 'package:flutter_educa/models/reading.dart';
import 'package:flutter_educa/services/remote_service.dart';
import 'package:flutter_educa/widgets/HeaderCard.dart';
import 'package:flutter_educa/widgets/MenuNavBar.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';

import '../widgets/Text/CustomText.dart';
import '../widgets/Text/CustomTitle.dart';

class LecturasScreen extends StatelessWidget {
  final String course; //Path_Course
  const LecturasScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/blueVector.png'))),
        child: Scaffold(
          drawer: const MenuNavBar(),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeaderCard(
                          educaColor: Colors.black,
                          message: false,
                          imageSize: 78,
                        ),
                        Row(
                          children: const [
                            CustomText(
                              text: '¡Conozcamos ',
                            ),
                            CustomText(
                              text: 'mucho más!',
                              bold: true,
                            ),
                          ],
                        ),
                        const CustomSubTitle(
                          color: Color.fromRGBO(69, 84, 255, 1),
                          text: 'Lecturas',
                          fontSize: 34,
                          bold: true,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  fontSize: 20,
                                  text: "Sesiones",
                                  bold: true,
                                ),
                                const SizedBox(height: 5),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: const [
                                      CardNumber(
                                        number: "01",
                                      ),
                                      CardNumber(
                                        number: "02",
                                      ),
                                      CardNumber(
                                        number: "03",
                                      ),
                                      CardNumber(
                                        number: "04",
                                      ),
                                      CardNumber(
                                        number: "05",
                                      ),
                                      CardNumber(
                                        number: "06",
                                      ),
                                      CardNumber(
                                        number: "07",
                                      ),
                                      CardNumber(
                                        number: "08",
                                      )
                                    ],
                                  ),
                                )
                              ]),
                        )
                      ]),
                ),
                const SizedBox(height: 30),
                Lecturas(
                  course: course,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Lecturas extends StatefulWidget {
  final String course;
  const Lecturas({Key? key, required this.course}) : super(key: key);

  @override
  State<Lecturas> createState() => _LecturasState();
}

class _LecturasState extends State<Lecturas> {
  List<Reading>? readings;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    //Fetch Data Videos
    getReadingsAPI();
  }

  getReadingsAPI() async {
    readings = await RemoteService().getReadings(widget.course);
    if (readings != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 600),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(69, 84, 255, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: Visibility(
        visible: isLoaded,
        replacement: const Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
          child: Column(children: ListReadings(readings)),
        ),
      ),
    );
  }
}

List<CardLecture> ListReadings(List<Reading>? readings) {
  List<CardLecture> list_readings = [];
  if (readings != null) {
    for (var item in readings) {
      list_readings.add(CardLecture(
        title: item.titulo,
        descrip: item.contenido,
        urlImage: item.imagen,
      ));
    }
  }
  return list_readings;
}

class CardLecture extends StatelessWidget {
  const CardLecture(
      {Key? key,
      required this.title,
      required this.descrip,
      required this.urlImage})
      : super(key: key);
  final String title;
  final String descrip;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/lectura_demo',
            arguments: {'title': title, 'image': urlImage, 'text': descrip});
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        height: 140,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                topRight: Radius.circular(25))),
        child: IntrinsicHeight(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(urlImage))),
                )),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CustomSubTitle(
                      text: title,
                      fontSize: 15,
                      bold: true,
                    ),
                    Text(
                      descrip,
                      maxLines: 6,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class CardNumber extends StatelessWidget {
  const CardNumber({Key? key, required this.number}) : super(key: key);

  final String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(69, 84, 255, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: CustomTitle(
          fontSize: 32,
          text: number,
          bold: true,
        ),
      ),
      width: 55,
      height: 55,
    );
  }
}
