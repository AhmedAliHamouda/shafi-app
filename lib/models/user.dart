import 'package:flutter/foundation.dart';

class UserAuth {
  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String password;

  UserAuth({
    this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.phoneNumber,
    @required this.password,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      password: json['password'],
    );
  }
}
