import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  String file,title,description;

   WebViewPage(this.file,this.title,this.description);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text((widget.title)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.network(widget.file,fit: BoxFit.fitHeight,),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0,right: 15.0,top: 10,bottom: 10),
              child: WebView(
                initialUrl: Uri.dataFromString(widget.description, mimeType: 'text/html',encoding: Encoding.getByName('utf-8')).toString(),
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
