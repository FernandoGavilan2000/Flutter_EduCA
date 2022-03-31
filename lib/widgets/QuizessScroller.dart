import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/QuizesCard.dart';

class QuizesScroller extends StatelessWidget {
  const QuizesScroller({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(234, 235, 255, 1),
        ),
        child: Column(
          children: const [
            QuizesCard(
              coloFondo: Color.fromRGBO(67, 101, 255, 1),
              description:
                  'El Caballero Carmelo tuvo muchas aventuras, ¡veamos cuales fueron!',
              title: 'El Caballero Carmelo',
              sizeTitle: 20,
            ),
            QuizesCard(
              coloFondo: Color.fromRGBO(63, 148, 255, 1),
              description:
                  'Enrique y Julio viven con su Abuelo que cria un puerco, y que a partir de esto se desencadena ..',
              title: 'Los Gallinazos sin plumas',
              sizeTitle: 20,
            ),
            QuizesCard(
              coloFondo: Color.fromRGBO(120, 205, 255, 1),
              description:
                  'Al momento de silabear tomamos algunos criteros encuenta, los hiatos y los diptongos',
              title: 'El Silabeo',
              sizeTitle: 20,
            ),
            QuizesCard(
              coloFondo: Color.fromRGBO(116, 212, 155, 1),
              description:
                  'Muchas veces nos olvidamos de distinguir estos acentos.¡Prueba tus habilidades!',
              title: 'EL Acento ortografico',
              sizeTitle: 17,
            ),
            QuizesCard(
              coloFondo: Color.fromRGBO(166, 148, 255, 1),
              description:
                  'Paco es un chico que se encontrará con problemas al llegar a la escuela, el conocerá a...',
              title: 'Paco Yunque',
              sizeTitle: 20,
            ),
            QuizesCard(
              coloFondo: Color.fromRGBO(67, 101, 255, 1),
              description:
                  'A veces solemos recurir a mencionar algunas oraciones que usan dos terminos implicitos...',
              title: 'Pleonasmos',
              sizeTitle: 20,
            ),
          ],
        ),
      ),
    );
  }
}
