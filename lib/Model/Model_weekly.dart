// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);
import 'dart:convert';
WeeklyAd weeklyFromJson(String str) => WeeklyAd.fromJson(json.decode(str));

String weeklyToJson(WeeklyAd data) => json.encode(data.toJson());

class WeeklyAd {
  WeeklyAd({
    this.status,
    this.list,
  });

  String status;
  List<States> list;

  factory WeeklyAd.fromJson(Map<String, dynamic> json) => WeeklyAd(
    status: json["status"],
    list: List<States>.from(json["path"].map((x) => States.fromJson(x))).reversed.toList(),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "path": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}

class States {
  States({
    this.id,
    this.title,
    this.file,
    this.state,
    this.sdate,
    this.edate,
    this.date,
  });
  String id;
  String title;
  String file;
  String state;
  String sdate;
  String edate;
  String date;
  factory States.fromJson(Map<String, dynamic> json) => States(
    id: json["id"],
    title: json["title"],
    file: json["file"],
    state: json["state"],
    sdate: json["startdate"],
    edate: json["enddate"],
    date: json["Created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "file": file,
    "state": state,
    "startdate": sdate,
    "enddate": edate,
    "Created_at" : date
  };
}


