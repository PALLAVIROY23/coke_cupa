// To parse this JSON data, do
//
//     final getAllBanners = getAllBannersFromJson(jsonString);

import 'dart:convert';

GetAllBanners getAllBannersFromJson(String str) => GetAllBanners.fromJson(json.decode(str));

String getAllBannersToJson(GetAllBanners data) => json.encode(data.toJson());

class GetAllBanners {
  BannerData? data;
  bool? success;
  String? message;

  GetAllBanners({
    this.data,
    this.success,
    this.message,
  });

  factory GetAllBanners.fromJson(Map<String, dynamic> json) => GetAllBanners(
    data: json["data"] == null ? null : BannerData.fromJson(json["data"]),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "success": success,
    "message": message,
  };
}

class BannerData {
  int? count;
  List<Row>? rows;

  BannerData({
    this.count,
    this.rows,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
    count: json["count"],
    rows: json["rows"] == null ? [] : List<Row>.from(json["rows"]!.map((x) => Row.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "rows": rows == null ? [] : List<dynamic>.from(rows!.map((x) => x.toJson())),
  };
}

class Row {
  int? id;
  int? zoneId;
  dynamic type;
  String? url;
  int? status;
  String? createdBy;
  int? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  Row({
    this.id,
    this.zoneId,
    this.type,
    this.url,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Row.fromJson(Map<String, dynamic> json) => Row(
    id: json["id"],
    zoneId: json["zone_id"],
    type: json["type"],
    url: json["url"],
    status: json["status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "zone_id": zoneId,
    "type": type,
    "url": url,
    "status": status,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
