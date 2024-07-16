// To parse this JSON data, do
//
//     final placeOrder = placeOrderFromJson(jsonString);

import 'dart:convert';

PlaceOrder placeOrderFromJson(String str) => PlaceOrder.fromJson(json.decode(str));

String placeOrderToJson(PlaceOrder data) => json.encode(data.toJson());

class PlaceOrder {
  bool? success;
  String? message;
  List<Datum>? data;

  PlaceOrder({
    this.success,
    this.message,
    this.data,
  });

  factory PlaceOrder.fromJson(Map<String, dynamic> json) => PlaceOrder(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? viewStatus;
  int? id;
  int? userId;
  int? productId;
  int? orderNumber;
  int? price;
  int? totalPoints;
  int? quantity;
  int? discount;
  DateTime? orderDate;
  DateTime? estimatedDate;
  DateTime? billDate;
  dynamic remarks;
  int? status;
  int? createdBy;
  int? updatedBy;
  int? userRemainingPoints;
  DateTime? updatedAt;
  DateTime? createdAt;

  Datum({
    this.viewStatus,
    this.id,
    this.userId,
    this.productId,
    this.orderNumber,
    this.price,
    this.totalPoints,
    this.quantity,
    this.discount,
    this.orderDate,
    this.estimatedDate,
    this.billDate,
    this.remarks,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.userRemainingPoints,
    this.updatedAt,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    viewStatus: json["view_status"],
    id: json["id"],
    userId: json["user_id"],
    productId: json["product_id"],
    orderNumber: json["order_number"],
    price: json["price"],
    totalPoints: json["total_points"],
    quantity: json["quantity"],
    discount: json["discount"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    estimatedDate: json["estimated_date"] == null ? null : DateTime.parse(json["estimated_date"]),
    billDate: json["bill_date"] == null ? null : DateTime.parse(json["bill_date"]),
    remarks: json["remarks"],
    status: json["status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    userRemainingPoints: json["user_remaining_points"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "view_status": viewStatus,
    "id": id,
    "user_id": userId,
    "product_id": productId,
    "order_number": orderNumber,
    "price": price,
    "total_points": totalPoints,
    "quantity": quantity,
    "discount": discount,
    "order_date": orderDate?.toIso8601String(),
    "estimated_date": estimatedDate?.toIso8601String(),
    "bill_date": billDate?.toIso8601String(),
    "remarks": remarks,
    "status": status,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "user_remaining_points": userRemainingPoints,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
  };
}
