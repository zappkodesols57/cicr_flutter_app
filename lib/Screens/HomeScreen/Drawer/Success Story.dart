import 'dart:convert';

import 'package:cicr_flutter_app/Model/Model_Success.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/PdfViewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class SuccessStory extends StatefulWidget {
  const SuccessStory({Key key}) : super(key: key);

  @override
  _SuccessStoryState createState() => _SuccessStoryState();
}

class _SuccessStoryState extends State<SuccessStory> {
  final ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String title,language;
  String api,appbar;

  @override
  void initState() {
    super.initState();
    autoFill();
    // getBills();
  }


  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");

    switch (language) {
      case "Eng":
        api = "https://www.zappkode.com/cicr/english/webservices/success_story/getSuccessStory";
        appbar = "Success Stories";
        break;

      case "Mar":
        api = "https://www.zappkode.com/cicr/marathi/webservices/success_story/getSuccessStory";
        appbar = "यशोगाथा";
        break;

      case "Hin":
        api = "https://www.zappkode.com/cicr/hindi/webservices/success_story/getSuccessStory";
        appbar = "सफलता की कहानियों";
        break;

      case "Gu":
        api = "https://www.zappkode.com/cicr/gujarati/webservices/success_story/getSuccessStory";
        appbar = "સક્સેસ સ્ટોરી";
        break;

      case "Kan":
        api = "https://www.zappkode.com/cicr/kannada/webservices/success_story/getSuccessStory";
        appbar = "ಯಶಸ್ಸಿನ ಕಥೆ";
        break;

    }
    setState(() {});
  }

  Future<SuccessStr> getStory() async {

    final res = await http.post(
      Uri.parse(api),
    );
    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      print(successFromJson(res.body).list.length);
      return successFromJson(res.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(appbar),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),

      body: FutureBuilder<SuccessStr>(
        future: getStory(),
        builder:
            (BuildContext context, AsyncSnapshot<SuccessStr> snapshot) {
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
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
                          child: Hero(
                            tag: snapshot.data.list[index].title.toString(),
                            child: new Card(
                            elevation: 3.0,
                            shadowColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,top: 10.0),
                              child: ListTile(
                                dense: false,
                                title: Text(snapshot.data.list[index].title,textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontFamily: "PoppinsBold")),
                                isThreeLine: false,
                                trailing: Text(snapshot.data.list[index].date,style: TextStyle(
                                    color: Colors.red,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 8.0),),
                                subtitle: Text(
                                  snapshot.data.list[index].description,textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.red,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                  // textAlign: TextAlign.end,
                                ),
                                leading: Image.network(snapshot.data.list[index].file,height: 40.0,width: 40.0,fit: BoxFit.cover,),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PdfViewer(snapshot.data.list[index].title,snapshot.data.list[index].description,snapshot.data.list[index].pdf,"Success Story")));
                                },
                              ),
                            ),
                          ),
                          ),
                        ),
                      );
                    }),
              );
            } else //`snapShot.hasData` can be false if the `snapshot.data` is null
              return Center(
                child: Text("No Data Found"),
              );}
        },
      ),
    );
  }
}
