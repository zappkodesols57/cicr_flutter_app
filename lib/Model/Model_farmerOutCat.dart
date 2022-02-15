// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

Farmercategory farmerCatCatFromJson(String str) => Farmercategory.fromJson(json.decode(str));

String farmerCatCatToJson(Farmercategory data) => json.encode(data.toJson());

class Farmercategory {
  Farmercategory({
    this.status,
    this.list,
  });

  String status;
  List<FarmerOutReachCat> list;

  factory Farmercategory.fromJson(Map<String, dynamic> json) => Farmercategory(
    status: json["status"],
    list: List<FarmerOutReachCat>.from(json["list"].map((x) => FarmerOutReachCat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class FarmerOutReachCat {
  FarmerOutReachCat({
    this.id,
    this.title,
    this.file,
    this.description,
    this.categoryId,
    this.date,
  });
  String id;
  String title;
  String file;
  String description;
  String categoryId;
  String date;

  factory FarmerOutReachCat.fromJson(Map<String, dynamic> json) => FarmerOutReachCat(
    id: json["id"],
    title: json["title"],
    file: json["file"],
    categoryId: json["category_id"],
    description: json["description"],
    date: json["Created_at"],


  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "title": title,
    "file": file,
    "description": description,
    "category_id": categoryId,
    "Created_at": date,
  };
}


