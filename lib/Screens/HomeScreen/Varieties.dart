import 'package:cicr_flutter_app/Model/Model_VarietiesCat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'VarietiesInfo.dart';

class TabVarieties extends StatefulWidget {
  String varieties,id;

  TabVarieties(this.varieties,this.id);

  @override
  _TabVarietiesState createState() => _TabVarietiesState();
}

class _TabVarietiesState extends State<TabVarieties> {

  String north,central,south, language;

  @override
  void initState() {
    autoFill();
  }

  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");

    switch (language) {
      case "Eng":
        north = "North Zone";
        central = "Central Zone";
        south = "South Zone";
        break;

      case "Mar":
        north = "उत्तर विभाग";
        central = "मध्य विभाग";
        south = "दक्षिण विभाग";
        break;

      case "Hin":
        north = "उत्तर क्षेत्र";
        central = "मध्य क्षेत्र";
        south = "दक्षिण क्षेत्र";
        break;

      case "Gu":
        north = "ઉત્તર ઝોન";
        central = "મધ્ય ઝોન";
        south = "દક્ષિણ ઝોન";
        break;

      case "Kan":
        north = "ಉತ್ತರ ವಲಯ";
        central = "ಕೇಂದ್ರ ವಲಯ";
        south = "ದಕ್ಷಿಣ ವಲಯ";
        break;
    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Text(widget.varieties),
            backgroundColor: Colors.green,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: north,
                ),
                Tab(
                  text: central,
                ),
                Tab(
                  text: south,
                )
              ],
              labelStyle: TextStyle(
                  fontFamily: "PoppinsMedium", fontWeight: FontWeight.bold),
            ),
          ),
          body: TabBarView(
            children: [
              North(widget.id),
              Central(widget.id),
              South(widget.id),
            ],
          ),
        ),
      ),
    );
  }


}

class North extends StatefulWidget {
  String id;
   North(this.id);

  @override
  _NorthState createState() => _NorthState();
}

class _NorthState extends State<North> {
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
            "https://www.zappkode.com/cicr/english/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";
        break;

      case "Mar":
        api =
            "https://www.zappkode.com/cicr/marathi/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";

        break;

      case "Hin":
        api =
            "https://www.zappkode.com/cicr/hindi/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";

        break;

      case "Gu":
        api =
            "https://www.zappkode.com/cicr/gujarati/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";

        break;

      case "Kan":
        api =
            "https://www.zappkode.com/cicr/kannada/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";

        break;
    }
    setState(() {});
  }

  Future<VarietiesModel> getVarieties(zone) async {
    final param = {
      "category_id": widget.id,
      "zone": zone,
    };

    final res = await http.post(
      Uri.parse(api),
      body: param,
    );

    print(res.body);
    print(res.statusCode);
    if (200 == res.statusCode) {
      print(varietiesFromJson(res.body).list.length);
      return varietiesFromJson(res.body);
    } else {
      throw Exception('Failed to load List');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: FutureBuilder<VarietiesModel>(
        future: getVarieties("North Zone"),
        builder:
            (BuildContext context, AsyncSnapshot<VarietiesModel> snapshot) {
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
                                      snapshot.data.list[index].subCategory,
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
                                            builder: (context) => VerietiesInfo(
                                                  snapshot.data.list[index].categoryId,
                                                  snapshot.data.list[index].id,
                                                  snapshot.data.list[index].zone,
                                                  snapshot.data.list[index].subCategory,
                                                )));
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
}

class Central extends StatefulWidget {
  String id;
  Central(this.id);

  @override
  _CentralState createState() => _CentralState();
}

class _CentralState extends State<Central> {
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
            "https://www.zappkode.com/cicr/english/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";
        break;

      case "Mar":
        api =
            "https://www.zappkode.com/cicr/marathi/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";

        break;

      case "Hin":
        api =
            "https://www.zappkode.com/cicr/hindi/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";

        break;

      case "Gu":
        api =
            "https://www.zappkode.com/cicr/gujarati/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";

        break;

      case "Kan":
        api =
            "https://www.zappkode.com/cicr/kannada/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";

        break;
    }
    setState(() {});
  }

  Future<VarietiesModel> getVarieties(zone) async {
    final param = {
      "category_id": widget.id,
      "zone": zone,
    };

    final res = await http.post(
      Uri.parse(api),
      body: param,
    );

    print(res.body);
    print(res.statusCode);
    if (200 == res.statusCode) {
      print(varietiesFromJson(res.body).list.length);
      return varietiesFromJson(res.body);
    } else {
      throw Exception('Failed to load List');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: FutureBuilder<VarietiesModel>(
        future: getVarieties("Central Zone"),
        builder:
            (BuildContext context, AsyncSnapshot<VarietiesModel> snapshot) {
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
                                      snapshot.data.list[index].subCategory,
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
                                            builder: (context) => VerietiesInfo(
                                              snapshot.data.list[index].categoryId,
                                              snapshot.data.list[index].id,
                                              snapshot.data.list[index].zone,
                                              snapshot.data.list[index].subCategory,
                                            )));
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
}

class South extends StatefulWidget {
  String id;
  South(this.id);

  @override
  _SouthState createState() => _SouthState();
}

class _SouthState extends State<South> {
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
            "https://www.zappkode.com/cicr/english/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";
        break;

      case "Mar":
        api =
            "https://www.zappkode.com/cicr/marathi/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";

        break;

      case "Hin":
        api =
            "https://www.zappkode.com/cicr/hindi/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";

        break;

      case "Gu":
        api =
            "https://www.zappkode.com/cicr/gujarati/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";

        break;

      case "Kan":
        api =
            "https://www.zappkode.com/cicr/kannada/webservices/Varieties_and_hybrids/get_subcategory_by_varieties_and_hybrids";

        break;
    }
    setState(() {});
  }

  Future<VarietiesModel> getVarieties(zone) async {
    final param = {
      "category_id": widget.id,
      "zone": zone,
    };

    final res = await http.post(
      Uri.parse(api),
      body: param,
    );

    print(res.body);
    print(res.statusCode);
    if (200 == res.statusCode) {
      print(varietiesFromJson(res.body).list.length);
      return varietiesFromJson(res.body);
    } else {
      throw Exception('Failed to load List');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: FutureBuilder<VarietiesModel>(
        future: getVarieties("South Zone"),
        builder:
            (BuildContext context, AsyncSnapshot<VarietiesModel> snapshot) {
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
                                      snapshot.data.list[index].subCategory,
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
                                            builder: (context) => VerietiesInfo(
                                              snapshot.data.list[index].categoryId,
                                              snapshot.data.list[index].id,
                                              snapshot.data.list[index].zone,
                                              snapshot.data.list[index].subCategory,
                                            )));
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
}
