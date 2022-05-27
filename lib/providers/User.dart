import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final String userID;
  final String firstName;
  final String lastName;
  String userImage;
  final String userEmail;
  final String userAddress;
  final String userBirthday;
  final String userCity;
  UserProvider({
    required this.userID,
    required this.firstName,
    required this.userEmail,
    this.lastName = '',
    this.userImage = '',
    this.userCity = '',
    this.userAddress = '',
    this.userBirthday = '',
  });

  void getDetails() {
    notifyListeners();
  }
}
