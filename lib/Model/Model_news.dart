// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

NewsPojo newsFromJson(String str) => NewsPojo.fromJson(json.decode(str));

String newsToJson(NewsPojo data) => json.encode(data.toJson());

class NewsPojo {
  NewsPojo({
    this.status,
    this.news,
  });

  String status;
  List<NewsModel> news;

  factory NewsPojo.fromJson(Map<String, dynamic> json) => NewsPojo(
    status: json["status"],
    news: List<NewsModel>.from(json["news"].map((x) => NewsModel.fromJson(x))).reversed.toList(),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "news": List<dynamic>.from(news.map((x) => x.toJson())),

  };
}

class NewsModel {
  NewsModel({
    this.id,
    this.title,
    this.url,
    this.date
  });


  String id;
  String title;
  String url;
  String date;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    date: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url": url,
    "created_at": date,

  };
}


