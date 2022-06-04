import 'package:flutter/material.dart';
import 'package:flutter_educa/providers/User.dart';
import 'package:flutter_educa/widgets/Text/CustomText.dart';
import 'package:provider/provider.dart';

class ProfileScroller extends StatelessWidget {
  const ProfileScroller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String firstName = Provider.of<UserProvider>(context).firstName;
    String lastName = Provider.of<UserProvider>(context).lastName;
    String userEmail = Provider.of<UserProvider>(context).userEmail;
    String userAddress = Provider.of<UserProvider>(context).userAddress;
    String userBirthday = Provider.of<UserProvider>(context).userBirthday;
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(45, 27, 239, 0.43),
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileDetail(title: 'Nombres', description: firstName),
            ProfileDetail(title: 'Apellidos', description: lastName),
            ProfileDetail(title: 'Correo', description: userEmail),
            ProfileDetail(
                title: 'Fecha de Nacimiento', description: userBirthday),
            ProfileDetail(title: 'Direccion', description: userAddress)
          ],
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  final String title;
  final String description;
  const ProfileDetail(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      padding: const EdgeInsets.all(15),
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "${title}:",
                color: const Color.fromRGBO(109, 96, 248, 1),
                fontSize: 17,
                bold: true,
              ),
              CustomText(
                text: description,
                fontSize: 15,
                bold: true,
              )
            ]),
        const Icon(
          Icons.edit,
          size: 35,
          color: Color.fromRGBO(109, 96, 248, 1),
        )
      ]),
    );
  }
}
