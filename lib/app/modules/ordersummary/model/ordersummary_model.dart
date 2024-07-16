// To parse this JSON data, do
//
//     final orderSummary = orderSummaryFromJson(jsonString);

class OrderSummary {
  Data? data;
  bool? success;
  String? message;

  OrderSummary({
    this.data,
    this.success,
    this.message,
  });

  factory OrderSummary.fromJson(Map<String, dynamic> json) => OrderSummary(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "success": success,
    "message": message,
  };
}

class Data {
  int? count;
  List<Row>? rows;

  Data({
    this.count,
    this.rows,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
  int? userId;
  int? productId;
  dynamic oldProductId;
  String? orderNumber;
  int? price;
  int? totalPoints;
  int? quantity;
  int? discount;
  DateTime? orderDate;
  DateTime? estimatedDate;
  DateTime? billDate;
  dynamic remarks;
  dynamic productRemark;
  int? status;
  int? viewStatus;
  int? createdBy;
  int? updatedBy;
  dynamic parentId;
  dynamic isWarehouse;
  int? userRemainingPoints;
  dynamic channelType;
  DateTime? createdAt;
  DateTime? updatedAt;
  Product? product;

  Row({
    this.id,
    this.userId,
    this.productId,
    this.oldProductId,
    this.orderNumber,
    this.price,
    this.totalPoints,
    this.quantity,
    this.discount,
    this.orderDate,
    this.estimatedDate,
    this.billDate,
    this.remarks,
    this.productRemark,
    this.status,
    this.viewStatus,
    this.createdBy,
    this.updatedBy,
    this.parentId,
    this.isWarehouse,
    this.userRemainingPoints,
    this.channelType,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory Row.fromJson(Map<String, dynamic> json) => Row(
    id: json["id"],
    userId: json["user_id"],
    productId: json["product_id"],
    oldProductId: json["old_product_id"],
    orderNumber: json["order_number"],
    price: json["price"],
    totalPoints: json["total_points"],
    quantity: json["quantity"],
    discount: json["discount"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    estimatedDate: json["estimated_date"] == null ? null : DateTime.parse(json["estimated_date"]),
    billDate: json["bill_date"] == null ? null : DateTime.parse(json["bill_date"]),
    remarks: json["remarks"],
    productRemark: json["product_remark"],
    status: json["status"],
    viewStatus: json["view_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    parentId: json["parent_id"],
    isWarehouse: json["is_warehouse"],
    userRemainingPoints: json["user_remaining_points"],
    channelType: json["channel_type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "product_id": productId,
    "old_product_id": oldProductId,
    "order_number": orderNumber,
    "price": price,
    "total_points": totalPoints,
    "quantity": quantity,
    "discount": discount,
    "order_date": orderDate?.toIso8601String(),
    "estimated_date": estimatedDate?.toIso8601String(),
    "bill_date": billDate?.toIso8601String(),
    "remarks": remarks,
    "product_remark": productRemark,
    "status": status,
    "view_status": viewStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "parent_id": parentId,
    "is_warehouse": isWarehouse,
    "user_remaining_points": userRemainingPoints,
    "channel_type": channelType,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "product": product?.toJson(),
  };
}

class Product {
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
  int? hsnSacCode;
  int? landingCost;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Product({
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
    this.hsnSacCode,
    this.landingCost,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
    hsnSacCode: json["hsn_sac_code"],
    landingCost: json["landing_cost"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
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
    "hsn_sac_code": hsnSacCode,
    "landing_cost": landingCost,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
