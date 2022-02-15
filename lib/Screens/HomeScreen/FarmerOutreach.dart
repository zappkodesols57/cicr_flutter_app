import 'package:cicr_flutter_app/Model/Model_ProtectionCat.dart';
import 'package:cicr_flutter_app/Model/Model_farmerOutCat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'WebView.dart';
class FarmerOutreachCat extends StatefulWidget {
  String id, file, category;
  FarmerOutreachCat(this.id,this.file,this.category);

  @override
  _FarmerOutreachCatState createState() => _FarmerOutreachCatState();
}

class _FarmerOutreachCatState extends State<FarmerOutreachCat> {

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
        "http://www.zappkode.com/cicr/english/webservices/farmer_outreach/getOutreach";
        break;

      case "Mar":
        api =
        "http://www.zappkode.com/cicr/marathi/webservices/farmer_outreach/getOutreach";

        break;

      case "Hin":
        api =
        "http://www.zappkode.com/cicr/hindi/webservices/farmer_outreach/getOutreach";

        break;

      case "Gu":
        api =
        "http://www.zappkode.com/cicr/gujarati/webservices/farmer_outreach/getOutreach";

        break;

      case "Kan":
        api =
        "http://www.zappkode.com/cicr/kannada/webservices/farmer_outreach/getOutreach";

        break;
    }
    setState(() {});
  }

  Future<Farmercategory> getFarmerOutreachCat() async {
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
    if (200 == res.statusCode) {
      print(farmerCatCatFromJson(res.body).list.length);
      return farmerCatCatFromJson(res.body);
    } else {
      throw Exception('Failed to load List');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.category),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<Farmercategory>(
        future: getFarmerOutreachCat(),
        builder:
            (BuildContext context, AsyncSnapshot<Farmercategory> snapshot) {
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
                                  leading: (snapshot.data.list[index].file.isEmpty)
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
                                    width: 60,
                                    height: 60,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot.data.list[index].file),
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

  getVarieties(String s) {}
}
