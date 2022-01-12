// To parse this JSON data, do
//
//     final getAllCategory = getAllCategoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetAllCategory getAllCategoryFromJson(String str) => GetAllCategory.fromJson(json.decode(str));

String getAllCategoryToJson(GetAllCategory data) => json.encode(data.toJson());

class GetAllCategory {
  GetAllCategory({
    required this.status,
    required this.msg,
    required this.data,
  });

  String status;
  String msg;
  List<Datum> data;

  factory GetAllCategory.fromJson(Map<String, dynamic> json) => GetAllCategory(
    status: json["status"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.categoryImage,
    required this.isActive,
  });

  int id;
  String name;
  String categoryImage;
  int isActive;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    categoryImage: json["category_image"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category_image": categoryImage,
    "is_active": isActive,
  };
}
