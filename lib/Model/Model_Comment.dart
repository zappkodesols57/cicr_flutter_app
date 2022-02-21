// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);
import 'dart:convert';
CommentMain commentMainFromJson(String str) => CommentMain.fromJson(json.decode(str));

String commentMainToJson(CommentMain data) => json.encode(data.toJson());

class CommentMain {
  CommentMain({
    this.status,
    this.commentList,
  });

  String status;
  List<CommentC> commentList;

  factory CommentMain.fromJson(Map<String, dynamic> json) => CommentMain(
    status: json["status"],
    commentList: List<CommentC>.from(json["list"].map((x) => CommentC.fromJson(x))).reversed.toList(),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "list": List<dynamic>.from(commentList.map((x) => x.toJson())),

  };
}
class CommentC {
  CommentC({
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

  factory CommentC.fromJson(Map<String, dynamic> json) => CommentC(
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

