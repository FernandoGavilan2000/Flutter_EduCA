import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';

import '../widgets/Text/CustomText.dart';
import '../widgets/Text/CustomTitle.dart';

class LecturasScreen extends StatelessWidget {
  const LecturasScreen({Key? key}) : super(key: key);

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
                        Container(
                          width: double.infinity,
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height * 0.1,
                          //child: Text("AQUI VA EL MENU HAMBURGUESA + Photo"),
                        ),
                        Row(
                          children: const [
                            CustomText(
                              text: '¡Conozcamos ',
                            ),
                            CustomText(
                              text: 'mucho mas!',
                              bold: true,
                            ),
                          ],
                        ),
                        const CustomSubTitle(
                          color: Color.fromRGBO(69, 84, 255, 1),
                          text: 'Lecturas',
                          fontSize: 35,
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
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(69, 84, 255, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Container(
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.01),
                    child: Column(children: const [
                      SizedBox(
                        height: 30,
                      ),
                      CardLecture(
                        title: 'El Caballero Carmelo',
                        urlImage:
                            'https://www.crisol.com.pe/media/catalog/product/cache/e5cc2c691f06511cdf7342631ad45b04/9/7/9786123050566_ahxt12pqu7v4n68z.jpg',
                        descrip:
                            'El cuento se inicia con la llegada de Roberto a casa después de una larga ausencia que dejó a la familia en la más completa tristeza. Roberto regresó cabalgando un hermoso caballo de paso y trayendo  regalos a sus seres queridos.',
                      ),
                      CardLecture(
                        title: 'Los Gallinazos sin Plumas',
                        urlImage:
                            'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1547605742l/43584858._SX318_.jpg',
                        descrip:
                            ' Es un cuento escrito por el cuentista y novelista peruano Julio Ramón Ribeyro aparecido en su primer libro de cuentos del mismo nombre (1955); también figura en La palabra del mudo, que es una recopilación de cuentos escritos entre 1955 y 1977. ',
                      ),
                      CardLecture(
                        title: 'El Bagrecico',
                        urlImage:
                            'http://3.bp.blogspot.com/-a41SKIuaS9k/UA2t2upBEWI/AAAAAAAAAQw/hMuMrzMzIbU/s1600/El+Bagrecico.jpg',
                        descrip:
                            'El resumen  de la obra el bragrecico de francisco izquierdo es el siguiente: Un anciano bagre de barbas muy largas decía con su voz ronca en el penumbroso remanso de un riachuelo de selva peruana; yo conozco el mar cuando fui joven he viajado a el y he vuelto.  ',
                      )
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
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
        Navigator.of(context).pushNamed('/lectura_demo');
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 18),
        height: 140,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                topRight: Radius.circular(25))),
        child: IntrinsicHeight(
          child: Row(children: [
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
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    CustomSubTitle(
                      text: title,
                      fontSize: 18,
                      bold: true,
                    ),
                    Text(
                      descrip,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
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
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(69, 84, 255, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: CustomTitle(
          text: number,
          bold: true,
        ),
      ),
      width: 70,
      height: 70,
    );
  }
}
