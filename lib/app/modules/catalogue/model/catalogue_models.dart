// To parse this JSON data, do
//
//     final viewAllProducts = viewAllProductsFromJson(jsonString);

import 'dart:convert';

ViewAllProducts viewAllProductsFromJson(String str) => ViewAllProducts.fromJson(json.decode(str));

String viewAllProductsToJson(ViewAllProducts data) => json.encode(data.toJson());

class ViewAllProducts {
  CatalogueData? data;
  bool? success;
  String? message;

  ViewAllProducts({
    this.data,
    this.success,
    this.message,
  });

  factory ViewAllProducts.fromJson(Map<String, dynamic> json) => ViewAllProducts(
    data: json["data"] == null ? null : CatalogueData.fromJson(json["data"]),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "success": success,
    "message": message,
  };
}

class CatalogueData {
  int? count;
  List<CatalogueList>? rows;
  int? maxPoints;

  CatalogueData({
    this.count,
    this.rows,
    this.maxPoints,
  });

  factory CatalogueData.fromJson(Map<String, dynamic> json) => CatalogueData(
    count: json["count"],
    rows: json["rows"] == null ? [] : List<CatalogueList>.from(json["rows"]!.map((x) => CatalogueList.fromJson(x))),
    maxPoints: json["maxPoints"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "rows": rows == null ? [] : List<dynamic>.from(rows!.map((x) => x.toJson())),
    "maxPoints": maxPoints,
  };
}

class CatalogueList {
  int? id;
  int? userId;
  int? categoryId;
  int? subCategoryId;
  String? name;
  String? slug;
  String? brandName;
  String? sku;
  dynamic specification;
  String? mainImage;
  String? shortDescription;
  dynamic longDescription;
  int? rating;
  int? mrp;
  int? discount;
  int? cost;
  int? pricePoint;
  int? quantity;
  int? ranking;
  DateTime? startDate;
  DateTime? endDate;
  int? qtyPerOrderLimit;
  int? supplierId;
  int? status;
  String? type;
  int? gst;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? rank;
  Category? category;
  Category? subcategory;
  dynamic supplier;
  List<dynamic>? productImages;

  CatalogueList({
    this.id,
    this.userId,
    this.categoryId,
    this.subCategoryId,
    this.name,
    this.slug,
    this.brandName,
    this.sku,
    this.specification,
    this.mainImage,
    this.shortDescription,
    this.longDescription,
    this.rating,
    this.mrp,
    this.discount,
    this.cost,
    this.pricePoint,
    this.quantity,
    this.ranking,
    this.startDate,
    this.endDate,
    this.qtyPerOrderLimit,
    this.supplierId,
    this.status,
    this.type,
    this.gst,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.rank,
    this.category,
    this.subcategory,
    this.supplier,
    this.productImages,
  });

  factory CatalogueList.fromJson(Map<String, dynamic> json) => CatalogueList(
    id: json["id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    name: json["name"],
    slug: json["slug"],
    brandName: json["brand_name"],
    sku: json["sku"],
    specification: json["specification"],
    mainImage: json["main_image"],
    shortDescription: json["short_description"],
    longDescription: json["long_description"],
    rating: json["rating"],
    mrp: json["mrp"],
    discount: json["discount"],
    cost: json["cost"],
    pricePoint: json["price_point"],
    quantity: json["quantity"],
    ranking: json["ranking"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    qtyPerOrderLimit: json["qty_per_order_limit"],
    supplierId: json["supplier_id"],
    status: json["status"],
    type: json["type"],
    gst: json["gst"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    rank: json["rank"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    subcategory: json["subcategory"] == null ? null : Category.fromJson(json["subcategory"]),
    supplier: json["supplier"],
    productImages: json["product_images"] == null ? [] : List<dynamic>.from(json["product_images"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "name": name,
    "slug": slug,
    "brand_name": brandName,
    "sku": sku,
    "specification": specification,
    "main_image": mainImage,
    "short_description": shortDescription,
    "long_description": longDescription,
    "rating": rating,
    "mrp": mrp,
    "discount": discount,
    "cost": cost,
    "price_point": pricePoint,
    "quantity": quantity,
    "ranking": ranking,
    "start_date": startDate?.toIso8601String(),
    "end_date": endDate?.toIso8601String(),
    "qty_per_order_limit": qtyPerOrderLimit,
    "supplier_id": supplierId,
    "status": status,
    "type": type,
    "gst": gst,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "rank": rank,
    "category": category?.toJson(),
    "subcategory": subcategory?.toJson(),
    "supplier": supplier,
    "product_images": productImages == null ? [] : List<dynamic>.from(productImages!.map((x) => x)),
  };
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? description;
  String? image;

  Category({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "description": description,
    "image": image,
  };
}
