import 'package:flutter/material.dart';
class CICRDirectory extends StatefulWidget {
  const CICRDirectory({Key key}) : super(key: key);

  @override
  _CICRDirectoryState createState() => _CICRDirectoryState();
}

class _CICRDirectoryState extends State<CICRDirectory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CICR Directory"),
      ),
    );
  }
}
