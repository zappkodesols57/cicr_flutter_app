// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

Farmer farmerFromJson(String str) => Farmer.fromJson(json.decode(str));

String farmerToJson(Farmer data) => json.encode(data.toJson());

class Farmer {
  Farmer({
    this.status,
    this.list,
  });

  String status;
  List<FarmerOutreach> list;

  factory Farmer.fromJson(Map<String, dynamic> json) => Farmer(
    status: json["status"],
    list: List<FarmerOutreach>.from(json["list"].map((x) => FarmerOutreach.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class FarmerOutreach {
  FarmerOutreach({
    this.id,
    this.file,
    this.category,
    this.date,
  });

  String id;
  String file;
  String category;
  String date;


  factory FarmerOutreach.fromJson(Map<String, dynamic> json) => FarmerOutreach(
    id: json["id"],
    file: json["file"],
    category: json["category_name"],
    date: json["Created_at"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "file": file,
    "category_name": category,
    "Created_at" : date,
  };
}


