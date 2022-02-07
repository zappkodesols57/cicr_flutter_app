// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

Varieties varietiesFromJson(String str) => Varieties.fromJson(json.decode(str));

String varietiesToJson(Varieties data) => json.encode(data.toJson());

class Varieties {
  Varieties({
    this.status,
    this.list,
  });

  String status;
  List<VaritiesList> list;

  factory Varieties.fromJson(Map<String, dynamic> json) => Varieties(
    status: json["status"],
    list: List<VaritiesList>.from(json["category"].map((x) => VaritiesList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "category": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class VaritiesList {
  VaritiesList({
    this.id,
    this.file,
    this.category,
  });

  String id;
  String file;
  String category;


  factory VaritiesList.fromJson(Map<String, dynamic> json) => VaritiesList(
    id: json["id"],
    file: json["file"],
    category: json["category"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "file": file,
    "category": category,
  };
}


