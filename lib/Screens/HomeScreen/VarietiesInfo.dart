import 'package:cicr_flutter_app/Model/Model_InfoVarieties.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/WebView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class VerietiesInfo extends StatefulWidget {
  String catId,subId,zone,subName;
   VerietiesInfo(this.catId,this.subId,this.zone,this.subName);

  @override
  _VerietiesInfoState createState() => _VerietiesInfoState();
}

class _VerietiesInfoState extends State<VerietiesInfo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final ScrollController _controller = ScrollController();

  String api, language;

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
        "https://www.zappkode.com/cicr/english/webservices/Varieties_and_hybrids/get_varieties_and_hybrid_info";
        break;

      case "Mar":
        api =
        "https://www.zappkode.com/cicr/marathi/webservices/Varieties_and_hybrids/get_varieties_and_hybrid_info";
        break;

      case "Hin":
        api =
        "https://www.zappkode.com/cicr/hindi/webservices/Varieties_and_hybrids/get_varieties_and_hybrid_info";
        break;

      case "Gu":
        api =
        "https://www.zappkode.com/cicr/gujarati/webservices/Varieties_and_hybrids/get_varieties_and_hybrid_info";
        break;

      case "Kan":
        api =
        "https://www.zappkode.com/cicr/kannada/webservices/Varieties_and_hybrids/get_varieties_and_hybrid_info";
        break;

    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((widget.subName)),
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
      body: FutureBuilder<VarietiesInfo>(
        future: getVarieties(),
        builder:
            (BuildContext context, AsyncSnapshot<VarietiesInfo> snapshot) {
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
                            tag: snapshot.data.list[index].id.toString(),
                            child: new Card(
                              elevation: 5.0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: ListTile(
                                  dense: true,
                                  title: Text(
                                      snapshot.data.list[index].title,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: "PoppinsMedium",
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold)),
                                  leading: (snapshot
                                      .data.list[index].file.isEmpty)
                                      ? Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: new BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                      new BorderRadius.circular(25.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: new Text(
                                      "C",
                                      style: TextStyle(
                                        fontSize: 23.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "PoppinsLight",
                                      ),
                                    ),
                                  )
                                      : Container(
                                    width: 60,
                                    height: 60,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshot.data.list[index].file),
                                      radius: 20.0,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios_sharp,
                                      color: Colors.green),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => WebViewPage(snapshot.data.list[index].file,snapshot.data.list[index].title,snapshot.data.list[index].description,)));
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
              );
          }
        },
      ),
    );
  }

  Future<VarietiesInfo> getVarieties() async {
    final param = {
      "category_id": widget.catId,
      "zone": widget.zone,
      "subcategory_id": widget.subId,
    };

    final res = await http.post(
      Uri.parse(api),
      body: param,
    );

    print(res.body);
    print(res.statusCode);
    if (200 == res.statusCode) {
      print(varietiesInfoFromJson(res.body).list.length);
      return varietiesInfoFromJson(res.body);
    } else {
      throw Exception('Failed to load List');
    }
  }
}
