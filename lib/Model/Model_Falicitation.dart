// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);
import 'dart:convert';
FarmerFalicitation f_FalicitationFromJson(String str) => FarmerFalicitation.fromJson(json.decode(str));

String f_FalicitationToJson(FarmerFalicitation data) => json.encode(data.toJson());

class FarmerFalicitation {
  FarmerFalicitation({
    this.status,
    this.list,
  });

  String status;
  List<Far_Falicitation> list;

  factory FarmerFalicitation.fromJson(Map<String, dynamic> json) => FarmerFalicitation(
    status: json["status"],
    list: List<Far_Falicitation>.from(json["list"].map((x) => Far_Falicitation.fromJson(x))).reversed.toList(),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class Far_Falicitation {
  Far_Falicitation({
    this.id,
    this.catID,
    this.file,
    this.file2,
    this.title,
    this.date,
    this.description,
    this.category,
  });

  String id;
  String catID;
  String file;
  String file2;
  String title;
  String date;
  String description;
  String category;


  factory Far_Falicitation.fromJson(Map<String, dynamic> json) => Far_Falicitation(
    id: json["id"],
    catID: json["category_id"],
    file: json["file"],
    file2: json["file1"],
    title: json["title"],
    date: json["date"],
    description: json["description"],
    category: json["category"],


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": catID,
    "file": file,
    "file1": file2,
    "title": title,
    "date": date,
    "description": description,
    "category": category,
  };
}


