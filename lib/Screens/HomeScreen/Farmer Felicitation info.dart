import 'dart:convert';
import 'package:cicr_flutter_app/Model/Model_Falicitation.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/PdfViewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class FelicitationInfo extends StatefulWidget {
  String id, category;
  FelicitationInfo(this.id,this.category);


  @override
  _FelicitationInfoState createState() => _FelicitationInfoState();
}

class _FelicitationInfoState extends State<FelicitationInfo> {
  final ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String title,language;
  String api,appbar;

  @override
  void initState() {
    super.initState();
    autoFill();

  }


  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");

    switch (language) {
      case "Eng":
        api = "https://www.zappkode.com/cicr/english/webservices/farmerfeli/getFarmerfeli";
        appbar = widget.category;
        break;

      case "Mar":
        api = "https://www.zappkode.com/cicr/marathi/webservices/farmerfeli/getFarmerfeli";
        appbar = widget.category;

        break;

      case "Hin":
        api = "https://www.zappkode.com/cicr/hindi/webservices/farmerfeli/getFarmerfeli";
        appbar = widget.category;

        break;

      case "Gu":
        api = "https://www.zappkode.com/cicr/gujarati/webservices/farmerfeli/getFarmerfeli";
        appbar = widget.category;

        break;

      case "Kan":
        api = "https://www.zappkode.com/cicr/kannada/webservices/farmerfeli/getFarmerfeli";
        appbar = widget.category;

        break;

    }
    setState(() {});
  }

  Future<FarmerFalicitation> getFelicitate() async {
    String id = widget.id;
    final param = {
      "category_id": id,
    };

    print(param);

    final res = await http.post(
      Uri.parse(api),
      body: param,
    );

    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      print(f_FalicitationFromJson(res.body).list.length);
      return f_FalicitationFromJson(res.body);
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
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<FarmerFalicitation>(
        future: getFelicitate(),
        builder:
            (BuildContext context, AsyncSnapshot<FarmerFalicitation> snapshot) {
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
                child:  ListView.builder(
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
                          title: Text(snapshot.data.list[index].title,textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.green,
                                  fontFamily: "PoppinsBold")),
                          isThreeLine: false,
                          trailing: Text(snapshot.data.list[index].date.substring(0,10),style: TextStyle(
                              color: Colors.red,
                              //fontWeight: FontWeight.bold,
                              fontSize: 8.0),),
                          subtitle: Html(data: snapshot.data.list[index].description),
                          // Text(
                          //   snapshot.data.list[index].description,textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //       color: Colors.red,
                          //       //fontWeight: FontWeight.bold,
                          //       fontSize: 12.0),
                          //   // textAlign: TextAlign.end,
                          // ),
                          leading: Image.network(snapshot.data.list[index].file,height: 40.0,width: 40.0,fit: BoxFit.cover,),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PdfViewer(snapshot.data.list[index].title,snapshot.data.list[index].description,snapshot.data.list[index].file2,appbar)));
                          },
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data.list.length,
                ),
              );
            } else
              return Center(
                child: Text("No Data Found"),
              );
          }
        },
      ),
    );
  }
}
