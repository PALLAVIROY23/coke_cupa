// To parse this JSON data, do
//
//     final removeFromCart = removeFromCartFromJson(jsonString);

import 'dart:convert';

RemoveFromCart removeFromCartFromJson(String str) => RemoveFromCart.fromJson(json.decode(str));

String removeFromCartToJson(RemoveFromCart data) => json.encode(data.toJson());

class RemoveFromCart {
  bool? success;
  String? message;

  RemoveFromCart({
    this.success,
    this.message,
  });

  factory RemoveFromCart.fromJson(Map<String, dynamic> json) => RemoveFromCart(
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
  };
}
