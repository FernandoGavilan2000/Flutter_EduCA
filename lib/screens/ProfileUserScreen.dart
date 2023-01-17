// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_educa/providers/User.dart';
//import 'package:flutter_educa/widgets/HeaderCard.dart';
import 'package:flutter_educa/widgets/ProfileScroller.dart';
import 'package:flutter_educa/widgets/Text/CustomSubTitle.dart';
import 'package:provider/provider.dart';

class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userImage = Provider.of<UserProvider>(context).userImage;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                const CustomSubTitle(
                  text: "¡Talento",
                  fontSize: 35,
                ),
                const CustomSubTitle(
                  text: "EduCA",
                  fontSize: 40,
                  bold: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(userImage),
                  ),
                )
              ]),
              const SizedBox(
                height: 360,
                child: ProfileScroller(),
              ),
              Column(
                children: const [
                  Image(
                      fit: BoxFit.cover,
                      width: 130,
                      height: 130,
                      image: NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/educa-app-6f86a.appspot.com/o/assets%2FCodigoQR.png?alt=media&token=3b8c6585-7d6d-43ab-9284-e664ce084085')),
                  CustomSubTitle(
                    text: 'Codigo de Talento',
                    bold: true,
                    fontSize: 15,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
