// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

ProtectionCatM protectionCatFromJson(String str) => ProtectionCatM.fromJson(json.decode(str));

String protectionCatToJson(ProtectionCatM data) => json.encode(data.toJson());

class ProtectionCatM {
  ProtectionCatM({
    this.status,
    this.list,
  });

  String status;
  List<ProtectionCatMod> list;

  factory ProtectionCatM.fromJson(Map<String, dynamic> json) => ProtectionCatM(
    status: json["status"],
    list: List<ProtectionCatMod>.from(json["list"].map((x) => ProtectionCatMod.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class ProtectionCatMod {
  ProtectionCatMod({
    this.title,
    this.file,
    this.des,
  });

  String title;
  String file;
  String des;


  factory ProtectionCatMod.fromJson(Map<String, dynamic> json) => ProtectionCatMod(
    title: json["title"],
    file: json["file"],
    des: json["description"],


  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "file": file,
    "description": des,
  };
}


