// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

CICRDir directoryFromJson(String str) => CICRDir.fromJson(json.decode(str));

String directoryToJson(CICRDir data) => json.encode(data.toJson());

class CICRDir {
  CICRDir({
    this.status,
    this.list,
  });

  String status;
  List<CICR> list;

  factory CICRDir.fromJson(Map<String, dynamic> json) => CICRDir(
    status: json["status"],
    list: List<CICR>.from(json["path"].map((x) => CICR.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "path": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class CICR {
  CICR({
    this.id,
    this.file,
    this.title,
    this.date,
  });

  String id;
  String file;
  String title;
  String date;


  factory CICR.fromJson(Map<String, dynamic> json) => CICR(
    id: json["id"],
    file: json["file"],
    title: json["title"],
    date: json["date"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "file": file,
    "title": title,
    "date": date,
  };
}


