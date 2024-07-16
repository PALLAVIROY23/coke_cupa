// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  bool? success;
  String? email;
  String? message;

  Login({
    this.success,
    this.email,
    this.message,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    success: json["success"],
    email: json["email"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "email": email,
    "message": message,
  };
}
