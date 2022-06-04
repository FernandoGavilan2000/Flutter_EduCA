import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/AudiosCard.dart';

class AudiosScroller extends StatelessWidget {
  const AudiosScroller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        padding: const EdgeInsets.only(top: 5),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(234, 235, 255, 1),
        ),
        child: Column(
          children: const [
            AudiosCard(
                titleText: 'El Caballero Carmelo',
                description: 'Aprenderemos la travesia que tomó Carmelo'),
            AudiosCard(
                titleText: 'El Acento',
                description: 'Aprenderás a usar estos dos acentos'),
            AudiosCard(
                titleText: 'El Silabeo',
                description: 'Aprenderás a como silabear pronunciando'),
            AudiosCard(
                titleText: 'Los Gentilicios',
                description: 'Aprenerás a como usar los gentilicios'),
            AudiosCard(
                titleText: 'Paco Yunque',
                description: 'Conoceremos la vida de Paco en la Escuela'),
            AudiosCard(
                titleText: 'El Bagrecico',
                description: 'Conocerás la aventura que tomó este pececito'),
            AudiosCard(
                titleText: 'Los Gallinazos sin plu...',
                description: 'Conocerás a Julio y Enrique, dos muchachos...'),
            AudiosCard(
                titleText: 'Tradiciones Peruanas',
                description: 'Ricardo Palma, un gran escritor'),
            AudiosCard(
                titleText: 'Fuente Ovejuna',
                description: 'Aprenderas sobre esta obra'),
          ],
        ),
      ),
    );
  }
}
