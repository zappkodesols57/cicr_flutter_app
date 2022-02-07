// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

GalleryModel galleryFromJson(String str) => GalleryModel.fromJson(json.decode(str));

String galleryToJson(GalleryModel data) => json.encode(data.toJson());

class GalleryModel {
  GalleryModel({
    this.status,
    this.gallery,
  });

  String status;
  List<GalleryView> gallery;

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
    status: json["status"],
    gallery: List<GalleryView>.from(json["gallery"].map((x) => GalleryView.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "gallery": List<dynamic>.from(gallery.map((x) => x.toJson())),

  };
}

class GalleryView {
  GalleryView({
    this.id,
    this.name,
    this.file,
    this.adesc,
    this.image,
    this.date,
  });

  String id;
  String name;
  String file;
  String adesc;
  String image;
  String date;


  factory GalleryView.fromJson(Map<String, dynamic> json) => GalleryView(
    id: json["id"],
    name: json["name"],
    file: json["url"],
    adesc: json["adesc"],
    image: json["image"],
    date: json["date"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": file,
    "adesc": adesc,
    "image":image,
    "date":date

  };
}


