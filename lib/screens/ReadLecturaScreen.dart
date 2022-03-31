import 'package:flutter/material.dart';
import 'package:flutter_educa/widgets/Text/CustomText.dart';
import 'package:flutter_educa/widgets/Text/CustomTitle.dart';

class ReadLecturaScreen extends StatelessWidget {
  const ReadLecturaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 45,
              child: Container(
                width: double.infinity,
                //Cambiale la imagen Gavilan
                child: Image.network(
                  'https://www.crisol.com.pe/media/catalog/product/cache/e5cc2c691f06511cdf7342631ad45b04/9/7/9786123050566_ahxt12pqu7v4n68z.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                flex: 55,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black87),
                  child: Column(children: const [
                    CustomTitle(
                      text: 'El Caballero Carmelo',
                      bold: true,
                      fontSize: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTitle(
                      text: 'ABRAHAM VALDELOMAR',
                      bold: false,
                      fontSize: 15,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Contado en primera persona con un lenguaje tierno, conmovedor y ambientado en un entorno provinciano y rural, este cuento nos narra la historia de un viejo gallo de pelea llamado el Caballero Carmelo, que debe enfrentar a otro más joven, el Ajiseco. El Carmelo, sacando fuerzas de flaqueza, gana, pero queda gravemente herido y poco después muere, ante la consternación de sus dueños.',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
