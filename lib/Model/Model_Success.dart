// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

SuccessStr successFromJson(String str) => SuccessStr.fromJson(json.decode(str));

String successToJson(SuccessStr data) => json.encode(data.toJson());

class SuccessStr {
  SuccessStr({
    this.status,
    this.list,
  });

  String status;
  List<SuccessSToryList> list;

  factory SuccessStr.fromJson(Map<String, dynamic> json) => SuccessStr(
    status: json["status"],
    list: List<SuccessSToryList>.from(json["list"].map((x) => SuccessSToryList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class SuccessSToryList {
  SuccessSToryList({
    this.id,
    this.file,
    this.title,
    this.date,
    this.description,
    this.pdf
  });

  String id;
  String file;
  String title;
  String date;
  String description;
  String pdf;


  factory SuccessSToryList.fromJson(Map<String, dynamic> json) => SuccessSToryList(
    id: json["id"],
    file: json["file"],
    title: json["title"],
    date: json["date"],
    description: json["short_description"],
    pdf: json["description_pdf"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "file": file,
    "title": title,
    "date": date,
    "short_description": description,
    "description_pdf": pdf,
  };
}


