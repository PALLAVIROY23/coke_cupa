// To parse this JSON data, do
//
//     final updateCart = updateCartFromJson(jsonString);

import 'dart:convert';

UpdateCart updateCartFromJson(String str) => UpdateCart.fromJson(json.decode(str));

String updateCartToJson(UpdateCart data) => json.encode(data.toJson());

class UpdateCart {
  bool? success;
  String? message;

  UpdateCart({
    this.success,
    this.message,
  });

  factory UpdateCart.fromJson(Map<String, dynamic> json) => UpdateCart(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
