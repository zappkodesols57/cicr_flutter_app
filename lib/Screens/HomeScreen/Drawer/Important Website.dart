import 'dart:convert';

import 'package:cicr_flutter_app/Model/Model_ImpWeb.dart';
import 'package:cicr_flutter_app/Model/Model_news.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
class ImpWebsite extends StatefulWidget {
  const ImpWebsite({Key key}) : super(key: key);

  @override
  _ImpWebsiteState createState() => _ImpWebsiteState();
}

class _ImpWebsiteState extends State<ImpWebsite> {

  final ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String  language;
  String api,title;

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
        title = "Important Websites";
        api = "https://www.zappkode.com/cicr/english/webservices/websitelink/getWebsiteLink";
        break;

      case "Mar":
        title ="महत्वाची वेबसाईट";
        api = "https://www.zappkode.com/cicr/marathi/webservices/websitelink/getWebsiteLink";

        break;

      case "Hin":
        title ="महत्वपूर्ण वेबसाइट";
        api = "https://www.zappkode.com/cicr/hindi/webservices/websitelink/getWebsiteLink";

        break;

      case "Gu":
        title ="મહત્વપૂર્ણ વેબસાઈટ";
        api = "https://www.zappkode.com/cicr/gujarati/webservices/websitelink/getWebsiteLink";

        break;

      case "Kan":
        title ="ಪ್ರಮುಖ ವೆಬ್‌ಸೈಟ್";
        api = "https://www.zappkode.com/cicr/kannada/webservices/websitelink/getWebsiteLink";

        break;

    }
    setState(() {});
  }

  Future<ImpWeb> getImpWeb() async {

    final res = await http.post(
      Uri.parse(api),
    );
    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      print(impWebFromJson(res.body).web.length);
      return impWebFromJson(res.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toString()),
        leading: IconButton(
            onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: FutureBuilder<ImpWeb>(
        future: getImpWeb(),
        builder:
            (BuildContext context, AsyncSnapshot<ImpWeb> snapshot) {
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
                child:ListView.builder(
                  // padding: const EdgeInsets.only(
                  //     bottom: kFloatingActionButtonMargin + 52),
                  shrinkWrap: true,
                  reverse: false,
                  controller: _controller,
                  itemBuilder: (bui, index) {
                    return new Card(
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0),
                        child: ListTile(
                          dense: true,
                          title: Text(
                              snapshot.data.web[index].title,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: "PoppinsMedium",
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                          leading: (snapshot.data.web[index].file.isEmpty)
                              ? Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: new BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                              new BorderRadius.circular(25.0),
                            ),
                            alignment: Alignment.center,
                            child: new Text("C",
                              style: TextStyle(
                                fontSize: 23.0,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontFamily: "PoppinsLight",
                              ),
                            ),
                          )
                              : Container(
                            width: 50,
                            height: 50,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data.web[index].file),
                              radius: 20.0,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_sharp,
                              color: Colors.green),
                          onTap: () {
                            launch(snapshot.data.web[index].url);
                          },
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data.web.length,
                ),
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
}
