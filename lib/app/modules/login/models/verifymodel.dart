// To parse this JSON data, do
//
//     final verifyotp = verifyotpFromJson(jsonString);

import 'dart:convert';

Verifyotp verifyotpFromJson(String str) => Verifyotp.fromJson(json.decode(str));

String verifyotpToJson(Verifyotp data) => json.encode(data.toJson());

class Verifyotp {
  bool ?success;
  Data ?data;
  String ?accessToken;
  String ?refreshToken;
  String ?message;

  Verifyotp({
     this.success,
     this.data,
     this.accessToken,
     this.refreshToken,
     this.message,
  });

  factory Verifyotp.fromJson(Map<String, dynamic> json) => Verifyotp(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
    "accessToken": accessToken,
    "refreshToken": refreshToken,
    "message": message,
  };
}

class Data {
  int id;
  String type;
  String title;
  String name;
  String email;
  int number;
  String code;
  dynamic emailVerifiedAt;
  dynamic passwordChangedAt;
  int active;
  String timezone;
  dynamic lastLoginAt;
  String providerId;
  String rememberToken;
  String businessCode;
  String internalCode;
  int flag;
  int testRecord;

  Data({
    required this.id,
    required this.type,
    required this.title,
    required this.name,
    required this.email,
    required this.number,
    required this.code,
    required this.emailVerifiedAt,
    required this.passwordChangedAt,
    required this.active,
    required this.timezone,
    required this.lastLoginAt,
    required this.providerId,
    required this.rememberToken,
    required this.businessCode,
    required this.internalCode,
    required this.flag,
    required this.testRecord,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    type: json["type"],
    title: json["title"],
    name: json["name"],
    email: json["email"],
    number: json["number"],
    code: json["code"],
    emailVerifiedAt: json["email_verified_at"],
    passwordChangedAt: json["password_changed_at"],
    active: json["active"],
    timezone: json["timezone"],
    lastLoginAt: json["last_login_at"],
    providerId: json["provider_id"],
    rememberToken: json["remember_token"],
    businessCode: json["business_code"],
    internalCode: json["internal_code"],
    flag: json["flag"],
    testRecord: json["testRecord"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "title": title,
    "name": name,
    "email": email,
    "number": number,
    "code": code,
    "email_verified_at": emailVerifiedAt,
    "password_changed_at": passwordChangedAt,
    "active": active,
    "timezone": timezone,
    "last_login_at": lastLoginAt,
    "provider_id": providerId,
    "remember_token": rememberToken,
    "business_code": businessCode,
    "internal_code": internalCode,
    "flag": flag,
    "testRecord": testRecord,
  };
}
