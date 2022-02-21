// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);
import 'dart:convert';
Discussion discussionFromJson(String str) => Discussion.fromJson(json.decode(str));

String discussionToJson(Discussion data) => json.encode(data.toJson());

class Discussion {
  Discussion({
    this.status,
    this.list,
  });

  String status;
  List<DiscussionMain> list;

  factory Discussion.fromJson(Map<String, dynamic> json) => Discussion(
    status: json["status"],
    list: List<DiscussionMain>.from(json["list"].map((x) => DiscussionMain.fromJson(x))).reversed.toList(),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),

  };
}
DiscussionMain discussionMainFromJson(String str) => DiscussionMain.fromJson(json.decode(str));

String discussionMainToJson(DiscussionMain data) => json.encode(data.toJson());
class DiscussionMain {
  DiscussionMain({
    this.id,
    this.heading,
    this.description,
    this.farmerId,
    this.authorName,
    this.file,
    this.date,
    this.profilePic,
    this.comments,
  });
  String id;
  String heading;
  String description;
  String farmerId;
  String authorName;
  String file;
  String date;
  String profilePic;
  List<TopicId> comments;
  factory DiscussionMain.fromJson(Map<String, dynamic> json) => DiscussionMain(
    id: json["id"],
    heading: json["heading"],
    description: json["description"],
    farmerId: json["farmer_id"],
    authorName: json["author_name"],
    file: json["file"],
    date: json["date"],
    profilePic: json["profile_pic"],
    comments: List<TopicId>.from(json["comments"].map((x) => TopicId.fromJson(x))).reversed.toList(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "heading": heading,
    "description": description,
    "farmer_id": farmerId,
    "author_name": authorName,
    "file": file,
    "date" : date,
    "profile_pic" : profilePic,
    "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
  };
}



class TopicId {
  TopicId({
    this.id,
    this.postId,
    this.comment,
    this.farmerId,
    this.commenterName,
    this.status,
    this.date,
  });
  String id;
  String postId;
  String comment;
  String farmerId;
  String commenterName;
  String status;
  String date;

  factory TopicId.fromJson(Map<String, dynamic> json) => TopicId(
    id: json["id"],
    postId: json["post_id"],
    comment: json["comment"],
    farmerId: json["farmer_id"],
    commenterName: json["commenter_name"],
    status: json["status"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post_id": postId,
    "comment": comment,
    "farmer_id": farmerId,
    "commenter_name": commenterName,
    "status": status,
    "date" : date
  };
}