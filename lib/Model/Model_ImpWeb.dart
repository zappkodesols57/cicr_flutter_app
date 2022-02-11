// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

ImpWeb impWebFromJson(String str) => ImpWeb.fromJson(json.decode(str));

String impWebToJson(ImpWeb data) => json.encode(data.toJson());

class ImpWeb {
  ImpWeb({
    this.status,
    this.web,
  });

  String status;
  List<ImpWebModel> web;

  factory ImpWeb.fromJson(Map<String, dynamic> json) => ImpWeb(
    status: json["status"],
    web: List<ImpWebModel>.from(json["websitelink"].map((x) => ImpWebModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "websitelink": List<dynamic>.from(web.map((x) => x.toJson())),

  };
}

class ImpWebModel {
  ImpWebModel({
    this.id,
    this.title,
    this.url,
    this.file,
    this.date
  });


  String id;
  String title;
  String url;
  String file;
  String date;

  factory ImpWebModel.fromJson(Map<String, dynamic> json) => ImpWebModel(
    id: json["id"],
    title: json["website_name"],
    url: json["website_link"],
    file: json["file"],
    date: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "website_name": title,
    "website_link": url,
    "file": file,
    "created_at": date,

  };
}


