// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

Facts factsFromJson(String str) => Facts.fromJson(json.decode(str));

String factsToJson(Facts data) => json.encode(data.toJson());

class Facts {
  Facts({
    this.status,
    this.list,
  });

  String status;
  List<FactsAndFigure> list;

  factory Facts.fromJson(Map<String, dynamic> json) => Facts(
    status: json["status"],
    list: List<FactsAndFigure>.from(json["list"].map((x) => FactsAndFigure.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class FactsAndFigure {
  FactsAndFigure({
    this.id,
    this.year,
    this.status,
    this.date,

  });

  String id;
  String year;
  String date;
  String status;



  factory FactsAndFigure.fromJson(Map<String, dynamic> json) => FactsAndFigure(
    id: json["id"],
    year: json["year"],
    status: json["status"],
    date: json["created_at"],



  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "year": year,
    "status": status,
    "created_at": date,
  };
}


