// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

Year yearFromJson(String str) => Year.fromJson(json.decode(str));

String yearToJson(Year data) => json.encode(data.toJson());

class Year {
  Year({
    this.status,
    this.list,
  });

  String status;
  List<YearId> list;

  factory Year.fromJson(Map<String, dynamic> json) => Year(
    status: json["status"],
    list: List<YearId>.from(json["list"].map((x) => YearId.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class YearId {
  YearId({
    this.id,
    this.year,
    this.status,
    this.date,
    this.name,
    this.file,
    this.description,

  });

  String id;
  String year;
  String date;
  String status;
  String name;
  String file;
  String description;



  factory YearId.fromJson(Map<String, dynamic> json) => YearId(
    id: json["id"],
    year: json["year"],
    status: json["status"],
    date: json["created_at"],
    name: json["name"],
    file: json["file"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "year": year,
    "status": status,
    "created_at": date,
    "name": name,
    "file": file,
    "description": description,
  };
}


