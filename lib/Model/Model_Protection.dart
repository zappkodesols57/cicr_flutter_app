// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

Protection protectionFromJson(String str) => Protection.fromJson(json.decode(str));

String protectionToJson(Protection data) => json.encode(data.toJson());

class Protection {
  Protection({
    this.status,
    this.list,
  });

  String status;
  List<ProtectionList> list;

  factory Protection.fromJson(Map<String, dynamic> json) => Protection(
    status: json["status"],
    list: List<ProtectionList>.from(json["list"].map((x) => ProtectionList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class ProtectionList {
  ProtectionList({
    this.id,
    this.file,
    this.category,
  });

  String id;
  String file;
  String category;


  factory ProtectionList.fromJson(Map<String, dynamic> json) => ProtectionList(
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


