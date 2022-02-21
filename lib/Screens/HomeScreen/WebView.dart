import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
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
          SizedBox(height: 15.0,),
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

class WebViewPage2 extends StatefulWidget {

  String id,category,file,details,north,south,central;

  WebViewPage2(this.id,this.category,this.file,this.details,this.north,this.south,this.central);

  @override
  _WebViewPage2State createState() => _WebViewPage2State();
}

class _WebViewPage2State extends State<WebViewPage2> {
  final ScrollController _controller = ScrollController();
  bool north = true, central = false, south = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text((widget.category)),
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
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.file,fit: BoxFit.fitHeight,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(widget.north.isNotEmpty || widget.north.contains('north') )
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(onPressed: (){
                      setState(() {
                        north = true;
                        central = false;
                        south = false;
                      });
                    },
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Text("North"),
                      color: (north)?Colors.green:Colors.green.shade100,
                      textColor: Colors.white,),
                  ),

                  if(widget.central.isNotEmpty || widget.central.contains('central') )
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(onPressed: (){
                        setState(() {
                          north = false;
                          central = true;
                          south = false;
                        });
                      },
                        elevation: 5.0,
                        child: Text("Central"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        color: (central)?Colors.green:Colors.green.shade100,
                        textColor: Colors.white,),
                    ),
                  if(widget.south.isNotEmpty || widget.south.contains('south') )
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(onPressed: (){
                      setState(() {
                        north = false;
                        central = false;
                        south = true;
                      });
                    },
                      elevation: 5.0,
                      child: Text("South"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      color: (south)?Colors.green:Colors.green.shade100,
                      textColor: Colors.white,),
                  ),
                ],
              ),
              Container(
                // height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0,right: 15.0,top: 10,bottom: 10),
                  child:HtmlWidget(widget.details)
                  // WebView(
                  //   initialUrl: Uri.dataFromString(widget.details, mimeType: 'text/html',encoding: Encoding.getByName('utf-8')).toString(),
                  //   javascriptMode: JavascriptMode.unrestricted,
                  // ),
                ),
              ),

          if(north)
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: HtmlWidget(widget.north,),
            ),

          if(central)
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: HtmlWidget(widget.central,),
            ),

          if(south)
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: HtmlWidget(widget.south,),
            ),

              //
              //
              // if(widget.central.isNotEmpty || widget.central.contains('central') )
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.all(20.0),
              //     child: HtmlWidget(widget.central,),
              //   ),
              // ),
              // if(widget.south.isNotEmpty || widget.south.contains('south') )
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child:
              //   HtmlWidget(widget.south,),
              // ),
              // if(widget.north.isNotEmpty || widget.north.contains('north') )
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: HtmlWidget(widget.north,),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}