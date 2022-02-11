import 'package:flutter/material.dart';
class SuccessStory extends StatefulWidget {
  const SuccessStory({Key key}) : super(key: key);

  @override
  _SuccessStoryState createState() => _SuccessStoryState();
}

class _SuccessStoryState extends State<SuccessStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Success story"),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(child: Text("Success story")),
    );
  }
}
