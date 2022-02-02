import 'package:flutter/material.dart';
class ImpWebsite extends StatefulWidget {
  const ImpWebsite({Key key}) : super(key: key);

  @override
  _ImpWebsiteState createState() => _ImpWebsiteState();
}

class _ImpWebsiteState extends State<ImpWebsite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Important Website"),
      ),
      body: Center(child: Text("Discussion Forum")),
    );
  }
}
