// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);
import 'dart:convert';
FalicitationCat f_FalicitationFromJson(String str) => FalicitationCat.fromJson(json.decode(str));

String f_FalicitationToJson(FalicitationCat data) => json.encode(data.toJson());

class FalicitationCat {
  FalicitationCat({
    this.status,
    this.list,
  });

  String status;
  List<Faci_Cat> list;

  factory FalicitationCat.fromJson(Map<String, dynamic> json) => FalicitationCat(
    status: json["status"],
    list: List<Faci_Cat>.from(json["list"].map((x) => Faci_Cat.fromJson(x))).reversed.toList(),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class Faci_Cat {
  Faci_Cat({
    this.id,
    this.file,
    this.category,
  });

  String id;
  String file;
  String category;


  factory Faci_Cat.fromJson(Map<String, dynamic> json) => Faci_Cat(
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


