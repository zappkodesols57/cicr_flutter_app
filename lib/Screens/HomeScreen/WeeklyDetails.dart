import 'dart:convert';

import 'package:cicr_flutter_app/Model/Model_weekly.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/PdfViewer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class WeeklyDetails extends StatefulWidget {
  String title;

  WeeklyDetails(this.title);
  @override
  _WeeklyDetailsState createState() => _WeeklyDetailsState();
}

class _WeeklyDetailsState extends State<WeeklyDetails> {
  final ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String title,language;
  String api,week;

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
        api = "https://www.zappkode.com/cicr/english/webservices/weekly_advisory/getWeeklyAdvisories";
        week = "Weekly Advisory";
        break;

      case "Mar":
        api = "https://www.zappkode.com/cicr/marathi/webservices/weekly_advisory/getWeeklyAdvisories";
        week = "साप्ताहिक सल्लागार";

        break;

      case "Hin":
        api = "https://www.zappkode.com/cicr/hindi/webservices/weekly_advisory/getWeeklyAdvisories";
        week = "साप्ताहिक सलाह";

        break;

      case "Gu":
        api = "https://www.zappkode.com/cicr/gujarati/webservices/weekly_advisory/getWeeklyAdvisories";
        week="સાપ્તાહિક સલાહ";

        break;

      case "Kan":
        api = "https://www.zappkode.com/cicr/kannada/webservices/weekly_advisory/getWeeklyAdvisories";
        week ="ಸಾಪ್ತಾಹಿಕ ಸಲಹೆ";

        break;

    }
    setState(() {});
  }

  Future<WeeklyAd> getWeekly() async {
    final param = {
      "state": widget.title,
    };
    print(widget.title);
    final res = await http.post(
        Uri.parse(api),
        body: param
    );
    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      print(weeklyFromJson(res.body).list.length);
      return weeklyFromJson(res.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(week),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<WeeklyAd>(
              future: getWeekly(),
              builder:
                  (BuildContext context, AsyncSnapshot<WeeklyAd> snapshot) {
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
                        // padding: const EdgeInsets.only(
                        //     bottom: kFloatingActionButtonMargin + 52),
                        shrinkWrap: true,
                        reverse: false,
                        controller: _controller,
                        itemBuilder: (bui, index) {
                          return InkWell(
                            child: new Card(
                                elevation: 3.0,
                                shadowColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child:ListTile(
                                  contentPadding: EdgeInsets.all(5),
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(snapshot.data.list[index].title,textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 14,
                                          fontFamily: "PoppinsMedium",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(snapshot.data.list[index].sdate,style: TextStyle(fontSize: 12,color: Colors.red,fontWeight: FontWeight.bold),),
                                      Text(snapshot.data.list[index].edate,style: TextStyle(fontSize: 12,color: Colors.red,fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                )
                            ),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PdfViewer("",
                                              snapshot.data.list[index].title,
                                              snapshot.data.list[index].file,
                                              week
                                          )
                                  )
                              );
                            },
                          );
                        },
                        itemCount: (snapshot.data.list.length >= 4)? 4 : snapshot.data.list.length,
                      ),
                    );
                  } else
                    return Center(
                      child: Text("No Data Found"),
                    );}
              },
            ),
          ),
        ],
      ),
    );
  }
}