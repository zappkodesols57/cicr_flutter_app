import 'package:flutter/material.dart';
class Felicitation extends StatefulWidget {
  const Felicitation({Key key}) : super(key: key);

  @override
  _FelicitationState createState() => _FelicitationState();
}

class _FelicitationState extends State<Felicitation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Farmer Felicitation "),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(child: Text("Farmer Felicitation")),
    );
  }
}
