// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

VarietiesModel varietiesFromJson(String str) => VarietiesModel.fromJson(json.decode(str));

String varietiesToJson(VarietiesModel data) => json.encode(data.toJson());

class VarietiesModel {
  VarietiesModel({
    this.status,
    this.list,
  });

  String status;
  List<VaritiesCAT> list;

  factory VarietiesModel.fromJson(Map<String, dynamic> json) => VarietiesModel(
    status: json["status"],
    list: List<VaritiesCAT>.from(json["list"].map((x) => VaritiesCAT.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class VaritiesCAT {
  VaritiesCAT({
    this.id,
    this.subCategory,
    this.categoryId,
    this.file,
    this.zone,
    this.category,
  });

  String id;
  String subCategory;
  String categoryId;
  String file;
  String zone;
  String category;


  factory VaritiesCAT.fromJson(Map<String, dynamic> json) => VaritiesCAT(
    id: json["id"],
    subCategory: json["subcategory"],
    categoryId: json["category_id"],
    file: json["file"],
    zone: json["zone"],
    category: json["category"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subcategory": subCategory,
    "category_id": categoryId,
    "file": file,
    "zone": zone,
    "category": category,
  };
}


