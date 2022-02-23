import 'dart:convert';

import 'package:cicr_flutter_app/Model/Model_CicrDirectory.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class CICRDirectory extends StatefulWidget {
  const CICRDirectory({Key key}) : super(key: key);
  @override
  _CICRDirectoryState createState() => _CICRDirectoryState();
}

class _CICRDirectoryState extends State<CICRDirectory> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final ScrollController _controller = ScrollController();
  String api, language;
  Dio dio = Dio();
  final path = '/storage/emulated/0/Download';

  String file;


  @override
  void initState() {
    autoFill();
  }

  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");

    switch (language) {
      case "Eng":
        api =
        "https://www.zappkode.com/cicr/english/webservices/cicr_directory/getDirectory";
        break;

      case "Mar":
        api =
        "https://www.zappkode.com/cicr/marathi/webservices/cicr_directory/getDirectory";

        break;

      case "Hin":
        api =
        "https://www.zappkode.com/cicr/hindi/webservices/cicr_directory/getDirectory";

        break;

      case "Gu":
        api =
        "https://www.zappkode.com/cicr/gujarati/webservices/cicr_directory/getDirectory";

        break;

      case "Kan":
        api =
        "https://www.zappkode.com/cicr/kannada/webservices/cicr_directory/getDirectory";

        break;
    }
    setState(() {});
  }

  Future<CICRDir> getCICRD() async {

    final res = await http.post(
      Uri.parse(api),

    );

    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      print(directoryFromJson(res.body).list.length);
      file = responseJson['path'][0]['file'];
      print(file);
      return directoryFromJson(res.body);
    } else {
      throw Exception('Failed to load List');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("CICR Directory"),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<CICRDir>(
        future: getCICRD(),
        builder:
            (BuildContext context, AsyncSnapshot<CICRDir> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  )),
            );
          else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text("No Data Found !"),
            );
          } else {
            if (snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (_controller.hasClients) {
                  _controller.animateTo(_controller.position.minScrollExtent,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.fastLinearToSlowEaseIn);
                } else {
                  setState(() => null);
                }
              });
              return Scrollbar(
                isAlwaysShown: true,
                controller: _controller,
                thickness: 3.0,
                child: ListView.builder(
                    itemCount: snapshot.data.list.length,
                    shrinkWrap: true,
                    reverse: false,
                    controller: _controller,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          ListTile(
                            dense: false,
                            title: Text(snapshot.data.list[index].title,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: "PoppinsBold")),
                            isThreeLine: false,
                            trailing:Wrap(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.share),
                                  onPressed: (){
                                    Share.share('CICR Directory \n\n${snapshot.data.list[index].file}');},
                                ),
                                IconButton(
                                  icon: Icon(Icons.download),
                                  onPressed: () async {
                                    launch(snapshot.data.list[index].file);
                                  },
                                ),
                              ],
                            ) ,
                            // subtitle: Text(
                            //   snapshot.data.list[index].date,
                            //   style: TextStyle(
                            //       color: Colors.red,
                            //       //fontWeight: FontWeight.bold,
                            //       fontSize: 12.0),
                            //   textAlign: TextAlign.end,),
                          ),
                          Center(
                            child: Container(
                              height: 500,
                                child: PDF(enableSwipe: true,swipeHorizontal: true).cachedFromUrl(snapshot.data.list[index].file)
                            ),
                          )
                        ],
                      );
                    }),
              );
            } else //`snapShot.hasData` can be false if the `snapshot.data` is null
              return Center(
                child: Text("No Data Found"),
              );
          }
        },
      ),
    );
  }
  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 16.0, fontFamily: "PoppinsMedium"),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    ));
  }
}
