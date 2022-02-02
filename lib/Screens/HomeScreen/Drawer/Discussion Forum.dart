import 'package:flutter/material.dart';
class DiscussionForum extends StatefulWidget {
  const DiscussionForum({Key key}) : super(key: key);

  @override
  _DiscussionForumState createState() => _DiscussionForumState();
}

class _DiscussionForumState extends State<DiscussionForum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Discussion Forum"),
      ),
      body:Center(child: Text("Discussion Forum")),
    );
  }
}
