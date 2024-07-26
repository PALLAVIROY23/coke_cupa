// To parse this JSON data, do
//
//     final verifyOtp = verifyOtpFromJson(jsonString);

import 'dart:convert';

VerifyOtp verifyOtpFromJson(String str) => VerifyOtp.fromJson(json.decode(str));

String verifyOtpToJson(VerifyOtp data) => json.encode(data.toJson());

class VerifyOtp {
  bool? success;
  Data? data;
  String? accessToken;
  String? refreshToken;
  String? message;

  VerifyOtp({
    this.success,
    this.data,
    this.accessToken,
    this.refreshToken,
    this.message,
  });

  factory VerifyOtp.fromJson(Map<String, dynamic> json) => VerifyOtp(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
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
  int? id;
  String? type;
  String? title;
  String? name;
  String? email;
  int? number;
  String? code;
  dynamic emailVerifiedAt;
  dynamic passwordChangedAt;
  int? active;
  String? timezone;
  dynamic lastLoginAt;
  String? providerId;
  String? rememberToken;
  String? businessCode;
  String? internalCode;
  int? flag;
  int? testRecord;

  Data({
    this.id,
    this.type,
    this.title,
    this.name,
    this.email,
    this.number,
    this.code,
    this.emailVerifiedAt,
    this.passwordChangedAt,
    this.active,
    this.timezone,
    this.lastLoginAt,
    this.providerId,
    this.rememberToken,
    this.businessCode,
    this.internalCode,
    this.flag,
    this.testRecord,
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
