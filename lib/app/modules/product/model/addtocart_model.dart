// To parse this JSON data, do
//
//     final addToCart = addToCartFromJson(jsonString);

import 'dart:convert';

AddToCart addToCartFromJson(String str) => AddToCart.fromJson(json.decode(str));

String addToCartToJson(AddToCart data) => json.encode(data.toJson());

class AddToCart {
  CartList? data;
  bool? success;
  String? message;

  AddToCart({
    this.data,
    this.success,
    this.message,
  });

  factory AddToCart.fromJson(Map<String, dynamic> json) => AddToCart(
    data: json["data"] == null ? null : CartList.fromJson(json["data"]),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "success": success,
    "message": message,
  };
}

class CartList {
  int? id;
  int? userId;
  int? productId;
  String? type;
  int? quantity;
  int? status;
  int? amount;
  int? customerNumber;
  DateTime? updatedAt;
  DateTime? createdAt;

  CartList({
    this.id,
    this.userId,
    this.productId,
    this.type,
    this.quantity,
    this.status,
    this.amount,
    this.customerNumber,
    this.updatedAt,
    this.createdAt,
  });

  factory CartList.fromJson(Map<String, dynamic> json) => CartList(
    id: json["id"],
    userId: json["user_id"],
    productId: json["product_id"],
    type: json["type"],
    quantity: json["quantity"],
    status: json["status"],
    amount: json["amount"],
    customerNumber: json["customerNumber"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "product_id": productId,
    "type": type,
    "quantity": quantity,
    "status": status,
    "amount": amount,
    "customerNumber": customerNumber,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
  };
}
