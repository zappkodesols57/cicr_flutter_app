// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

VarietiesInfo varietiesInfoFromJson(String str) => VarietiesInfo.fromJson(json.decode(str));

String varietiesInfoToJson(VarietiesInfo data) => json.encode(data.toJson());

class VarietiesInfo {
  VarietiesInfo({
    this.status,
    this.list,
  });

  String status;
  List<VaritiesInfoList> list;

  factory VarietiesInfo.fromJson(Map<String, dynamic> json) => VarietiesInfo(
    status: json["status"],
    list: List<VaritiesInfoList>.from(json["list"].map((x) => VaritiesInfoList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class VaritiesInfoList {
  VaritiesInfoList({
    this.id,
    this.categoryId,
    this.subCatId,
    this.title,
    this.description,
    this.file,
    this.zone,
    this.category,
    this.subCategory,

  });

  String id;
  String categoryId;
  String subCatId;
  String title;
  String description;
  String file;
  String zone;
  String category;
  String subCategory;


  factory VaritiesInfoList.fromJson(Map<String, dynamic> json) => VaritiesInfoList(
    id: json["id"],
    categoryId: json["category_id"],
    subCatId: json["subcategory_id"],
    title: json["title"],
    description: json["description"],
    file: json["file"],
    zone: json["zone"],
    category: json["category"],
    subCategory: json["subcategory"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "subcategory_id": subCatId,
    "title": title,
    "description": description,
    "file": file,
    "zone": zone,
    "category": category,
    "subcategory": subCategory,
  };
}


