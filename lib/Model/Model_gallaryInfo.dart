// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

GalleryInfoModel galleryInfoFromJson(String str) => GalleryInfoModel.fromJson(json.decode(str));

String galleryinfoToJson(GalleryInfoModel data) => json.encode(data.toJson());

class GalleryInfoModel {
  String name;
  Url url;
  String date;

  GalleryInfoModel({this.name, this.url, this.date});

  GalleryInfoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'] != null ? new Url.fromJson(json['url']) : null;
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.url != null) {
      data['url'] = this.url.toJson();
    }
    data['date'] = this.date;
    return data;
  }
}

class Url {
  String small;
  String medium;
  String large;

  Url({this.small, this.medium, this.large});

  Url.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}


