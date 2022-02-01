import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("CICR"),
      ),
      drawer: Drawer(

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Text("Hello"),
      ),
    );
  }
}