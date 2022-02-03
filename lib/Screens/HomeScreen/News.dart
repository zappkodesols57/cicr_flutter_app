import 'dart:convert';
import 'package:cicr_flutter_app/Model/Model_news.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  const News({Key key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  final ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String title,language;
  String api;

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
        api = "https://www.zappkode.com/cicr/english/webservices/Varieties_and_hybrids/get_news";
        break;

      case "Mar":
        api = "https://www.zappkode.com/cicr/marathi/webservices/News/get_news";

        break;

      case "Hin":
        api = "https://www.zappkode.com/cicr/hindi/webservices/News/get_news";

        break;

      case "Gu":
        api = "https://www.zappkode.com/cicr/gujarati/webservices/News/get_news";

        break;

      case "Kan":
        api = "https://www.zappkode.com/cicr/kannada/webservices/News/get_news";

        break;

    }
    setState(() {});
  }

  Future<NewsPojo> getBills() async {

    final res = await http.post(
      Uri.parse(api),
    );
    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      print(newsFromJson(res.body).news.length);
      return newsFromJson(res.body);
      // print(newsFromJson(NewsModel[0].title));
    } else {
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: Text("News"),
      // ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<NewsPojo>(
              future: getBills(),
              builder: (ctx, AsyncSnapshot<NewsPojo> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        )),
                  );
                else {
                    return Scrollbar(
                      isAlwaysShown: true,
                      controller: _controller,
                      thickness: 3.0,
                      child: ListView.builder(
                        // padding: const EdgeInsets.only(
                        //     bottom: kFloatingActionButtonMargin + 52),
                        shrinkWrap: true,
                        reverse: false,
                        controller: _controller,
                        itemBuilder: (bui, index) {
                          return new Card(
                            elevation: 3.0,
                            shadowColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0,top: 10.0),
                              child: ListTile(
                                dense: false,
                                title: Text(snapshot.data.news[index].title,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontFamily: "PoppinsBold")),
                                isThreeLine: false,
                                subtitle: Text(
                                  snapshot.data.news[index].date,
                                  style: TextStyle(
                                      color: Colors.red,
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.end,),
                                leading: Image.asset("assets/logo.png",height: 30.0,width: 30.0,),
                                // trailing: Wrap(
                                //   direction: Axis.vertical,
                                //   spacing: 5, // space between two icons
                                //   crossAxisAlignment: WrapCrossAlignment.end,
                                //   children: <Widget>[
                                //     SizedBox(height: 10,),
                                //
                                //   ],
                                // ),
                                onTap: () {
                                  launch(snapshot.data.news[index].url);
                                },
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data.news.length,
                      ),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
