// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

Production productionFromJson(String str) => Production.fromJson(json.decode(str));

String productionToJson(Production data) => json.encode(data.toJson());

class Production {
  Production({
    this.status,
    this.list,
  });

  String status;
  List<ProductionList> list;

  factory Production.fromJson(Map<String, dynamic> json) => Production(
    status: json["status"],
    list: List<ProductionList>.from(json["list"].map((x) => ProductionList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class ProductionList {
  ProductionList({
    this.id,
    this.file,
    this.category,
    this.details,
    this.file2,
    this.file3,
    this.file4,
    this.central,
    this.north,
    this.south,
  });

  String id;
  String file;
  String details;
  String category;
  String file2;
  String file3;
  String file4;
  String north;
  String south;
  String central;


  factory ProductionList.fromJson(Map<String, dynamic> json) => ProductionList(
    id: json["id"],
    file: json["file_one"],
    category: json["category"],
    details: json["details"],
    file2: json["file_two"],
    file3: json["file_three"],
    file4: json["file_four"],
    north: json["north"],
    south: json["south"],
    central: json["central"],



  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "file": file,
    "category": category,
  };
}


