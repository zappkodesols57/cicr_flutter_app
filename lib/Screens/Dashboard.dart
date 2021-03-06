import 'package:carousel_pro/carousel_pro.dart';
import 'package:cicr_flutter_app/Model/Model_Facts.dart';
import 'package:cicr_flutter_app/Model/Model_FarmerOutreach.dart';
import 'package:cicr_flutter_app/Model/Model_Production.dart';
import 'package:cicr_flutter_app/Model/Model_Protection.dart';
import 'package:cicr_flutter_app/Model/Model_Varieties.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/FactsAndFiguresYear.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/FarmerOutreach.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/ProtectionCat.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/WebView.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Weekly%20Advisory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'HomeScreen/Varieties.dart';

class Dashboard extends StatefulWidget {
  String language;

  Dashboard(this.language);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final ScrollController _controller = ScrollController();
  AnimationController animationController;
  String api, api2, api3, apiFacts, apiFarmer;

  // String language;
  @override
  void initState() {
    autoFill();
  }

  String varieties, production, protection, facts, farmer, weekly;

  // @override
  // void initState() {
  //   autoFill();
  // }

  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // language = prefs.getString("language");
    // print(prefs.getString("language"));

    switch (widget.language) {
      case "Eng":
        varieties = "Varieties And \nHybrid";
        production = "Production \nTechnology";
        protection = "Protection \nTechnology";
        facts = "Facts And \nFigures";
        farmer = "Farmers \nOutreach";
        weekly = "Weekly \nAdvisory";
        api =
            "https://www.zappkode.com/cicr/english/webservices/Varieties_and_hybrids/get_category_by_varities_and_hybrids";
        api2 =
            "https://www.zappkode.com/cicr/english/webservices/protection_technology/getProtectionCategory";
        api3 =
            "https://www.zappkode.com/cicr/english/webservices/Production/getProduction_info";
        apiFacts =
            "https://www.zappkode.com/cicr/english/webservices/Facts_and_figures/get_year_data";
        apiFarmer =
            "http://www.zappkode.com/cicr/english/webservices/farmer_outreach/getCategoryDetails";
        break;

      case "Mar":
        varieties = "????????? ????????? ??????????????????";
        production = "????????????????????? ??????????????????????????????";
        protection = "????????????????????? ??????????????????????????????";
        facts = "??????????????? ????????? ????????????????????????";
        farmer = "?????????????????? ???????????????";
        weekly = "??????????????????????????? ????????????????????????";
        api =
            "https://www.zappkode.com/cicr/marathi/webservices/Varieties_and_hybrids/get_category_by_varities_and_hybrids";
        api2 =
            "https://www.zappkode.com/cicr/marathi/webservices/protection_technology/getProtectionCategory";
        api3 =
            "https://www.zappkode.com/cicr/marathi/webservices/Production/getProduction_info";
        apiFacts =
            "https://www.zappkode.com/cicr/marathi/webservices/Facts_and_figures/get_year_data";
        apiFarmer =
            "http://www.zappkode.com/cicr/marathi/webservices/farmer_outreach/getCategoryDetails";
        break;

      case "Hin":
        varieties = "????????????????????? ?????? ????????????????????????";
        production = "????????????????????? ????????????????????????????????????";
        protection = "????????????????????? ????????????????????????????????????";
        facts = "???????????? ?????? ??????????????????";
        farmer = "??????????????? ??????????????????";
        weekly = "??????????????????????????? ????????????";
        api =
            "https://www.zappkode.com/cicr/hindi/webservices/Varieties_and_hybrids/get_category_by_varities_and_hybrids";
        api2 =
            "https://www.zappkode.com/cicr/hindi/webservices/protection_technology/getProtectionCategory";
        api3 =
            "https://www.zappkode.com/cicr/hindi/webservices/Production/getProduction_info";
        apiFacts =
            "https://www.zappkode.com/cicr/hindi/webservices/Facts_and_figures/get_year_data";
        apiFarmer =
            "http://www.zappkode.com/cicr/hindi/webservices/farmer_outreach/getCategoryDetails";
        break;

      case "Gu":
        varieties = "???????????? ????????? ????????????????????????";
        production = "????????????????????? ???????????????????????????";
        protection = "?????????????????????????????? ???????????????????????????";
        facts = "?????????????????? ????????? ???????????????";
        farmer = "?????????????????? ??????????????????";
        weekly = "??????????????????????????? ????????????";
        api =
            "https://www.zappkode.com/cicr/gujarati/webservices/Varieties_and_hybrids/get_category_by_varities_and_hybrids";
        api2 =
            "https://www.zappkode.com/cicr/gujarati/webservices/protection_technology/getProtectionCategory";
        api3 =
            "https://www.zappkode.com/cicr/gujarati/webservices/Production/getProduction_info";
        apiFacts =
            "https://www.zappkode.com/cicr/gujarati/webservices/Facts_and_figures/get_year_data";
        apiFarmer =
            "http://www.zappkode.com/cicr/gujarati/webservices/farmer_outreach/getCategoryDetails";
        break;

      case "Kan":
        varieties = "??????????????????????????? ??????????????? ????????????????????????";
        production = "???????????????????????? ??????????????????????????????";
        protection = "?????????????????? ??????????????????????????????";
        facts = "???????????????????????? ??????????????? ??????????????????????????????";
        farmer = "???????????? ?????????????????????";
        weekly = "??????????????????????????? ???????????????";
        api =
            "https://www.zappkode.com/cicr/kannada/webservices/Varieties_and_hybrids/get_category_by_varities_and_hybrids";
        api2 =
            "https://www.zappkode.com/cicr/kannada/webservices/protection_technology/getProtectionCategory";
        api3 =
            "https://www.zappkode.com/cicr/kannada/webservices/Production/getProduction_info";
        apiFacts =
            "https://www.zappkode.com/cicr/kannada/webservices/Facts_and_figures/get_year_data";
        apiFarmer =
            "http://www.zappkode.com/cicr/kannada/webservices/farmer_outreach/getCategoryDetails";
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: Text("CICR"),
      // ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: 200.0,
                  width: 350.0,
                  child: Carousel(
                    radius: Radius.circular(15.0),
                    borderRadius: true,
                    boxFit: BoxFit.cover,
                    autoplay: true,
                    dotSpacing: 8.0,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 1000),
                    dotSize: 5.0,
                    dotIncreasedColor: Color(0xFF4C853E),
                    dotBgColor: Colors.black26,
                    dotPosition: DotPosition.bottomCenter,
                    dotVerticalPadding: 2.0,
                    showIndicator: true,
                    indicatorBgPadding: 7.0,
                    images: [
                      AssetImage("assets/one.jpg"),
                      AssetImage("assets/two.jpg"),
                      AssetImage("assets/three.jpg"),
                      AssetImage("assets/four.jpg"),
                      AssetImage("assets/five.jpg"),
                      AssetImage("assets/six.jpg"),
                      AssetImage("assets/seven.jpg"),
                      AssetImage("assets/eight.jpg"),
                      AssetImage("assets/nine.jpg"),
                      AssetImage("assets/ten.jpg"),
                      AssetImage("assets/eleven.jpg"),
                      AssetImage("assets/twelve.jpg"),
                      AssetImage("assets/thirteen.jpg"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showVHDialog(context);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => TabVarieties(varieties)));
                    },
                    child: Container(
                      width: 170.0,
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "assets/dashboard/agriculture.png",
                                  fit: BoxFit.cover,
                                  height: 70.0,
                                  width: 70.0,
                                )),
                            Container(
                              margin: EdgeInsets.only(bottom: 3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.green,
                              ),
                              padding: EdgeInsets.all(3.0),
                              width: 125.0,
                              child: Text(
                                varieties ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showProductionDialog(context);
                    },
                    child: Container(
                      // height:120.0,
                      width: 170.0,
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "assets/dashboard/agriculture2.png",
                                  fit: BoxFit.cover,
                                  height: 70.0,
                                  width: 70.0,
                                )),
                            Container(
                              margin: EdgeInsets.only(bottom: 3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.green,
                              ),
                              // height: 20.0,
                              padding: EdgeInsets.all(3.0),
                              width: 125.0,
                              child: Text(
                                production ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showProtectionDialog(context);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => TabVarieties(varieties)));
                    },
                    child: Container(
                      // height:120.0,
                      width: 170.0,
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "assets/dashboard/agriculture3.png",
                                  fit: BoxFit.cover,
                                  height: 70.0,
                                  width: 70.0,
                                )),
                            Container(
                              margin: EdgeInsets.only(bottom: 3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.green,
                              ),
                              // height: 20.0,
                              padding: EdgeInsets.all(3.0),
                              width: 125.0,
                              child: Text(
                                protection ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      _showFactsAndFigureDialog(context);
                    },
                    child: Container(
                      // height:120.0,
                      width: 170.0,
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "assets/dashboard/agriculture4.png",
                                  fit: BoxFit.cover,
                                  height: 70.0,
                                  width: 70.0,
                                )),
                            Container(
                              margin: EdgeInsets.only(bottom: 3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.green,
                              ),
                              // height: 20.0,
                              padding: EdgeInsets.all(3.0),
                              width: 125.0,
                              child: Text(
                                facts ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showFarmerOutreachDialog(context);
                    },
                    child: Container(
                      // height:120.0,
                      width: 170.0,
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "assets/dashboard/agriculture5.png",
                                  fit: BoxFit.cover,
                                  height: 70.0,
                                  width: 70.0,
                                )),
                            Container(
                              margin: EdgeInsets.only(bottom: 3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.green,
                              ),
                              // height: 20.0,
                              padding: EdgeInsets.all(3.0),
                              width: 125.0,
                              child: Text(
                                farmer ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> WeeklyAdvisory()));
                    },
                    child: Container(
                      // height:120.0,
                      width: 170.0,
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "assets/dashboard/agriculture6.png",
                                  fit: BoxFit.cover,
                                  height: 70.0,
                                  width: 70.0,
                                )),
                            Container(
                              margin: EdgeInsets.only(bottom: 3.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.green,
                              ),
                              // height: 20.0,
                              padding: EdgeInsets.all(3.0),
                              width: 125.0,
                              child: Text(
                                weekly ?? "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showVHDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10.0,
            title: Text(
              varieties,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w800,
                  fontSize: 15.0,
                  fontFamily: "PoppinsMedium"),
            ),
            content: Container(
              height: 150.0,
              width: 300.0,
              child: FutureBuilder<Varieties>(
                future: getVarieties(),
                builder:
                    (BuildContext context, AsyncSnapshot<Varieties> snapshot) {
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
                          _controller.animateTo(
                              _controller.position.minScrollExtent,
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
                                child: Hero(
                                  tag: snapshot.data.list[index].id.toString(),
                                  child: new Card(
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: ListTile(
                                        dense: true,
                                        title: Text(
                                            snapshot.data.list[index].category,
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
                                                      new BorderRadius.circular(
                                                          25.0),
                                                ),
                                                alignment: Alignment.center,
                                                child: new Text(
                                                  "C",
                                                  style: TextStyle(
                                                    fontSize: 23.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: "PoppinsLight",
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                width: 60,
                                                height: 60,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      snapshot.data.list[index]
                                                          .file),
                                                  radius: 20.0,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                        // trailing: Icon(Icons.arrow_forward_ios_sharp,
                                        //     color: Colors.green),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TabVarieties(
                                                        snapshot
                                                            .data
                                                            .list[index]
                                                            .category,
                                                        snapshot.data
                                                            .list[index].id,
                                                      )));
                                        },
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
            ),
            // actions: <Widget>[
            //   MaterialButton(
            //     minWidth: 200.0,
            //     color: Colors.red,
            //     child:
            //     Text('Cancel', style: TextStyle(color: Colors.white,fontFamily: "PoppinsMedium",fontWeight: FontWeight.bold)),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ],
          );
        });
  }

  Future<Varieties> getVarieties() async {
    // final param = {
    //   "category_id": widget.catId,
    //   "zone": widget.zone,
    //   "subcategory_id": widget.subId,
    // };

    final res = await http.post(
      Uri.parse(api),
      // body: param,
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

  void _showProtectionDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10.0,
            title: Text(
              protection,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w800,
                  fontSize: 15.0,
                  fontFamily: "PoppinsMedium"),
            ),
            content: Container(
              height: 150.0,
              width: 300.0,
              child: FutureBuilder<Protection>(
                future: getProtection(),
                builder:
                    (BuildContext context, AsyncSnapshot<Protection> snapshot) {
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
                          _controller.animateTo(
                              _controller.position.minScrollExtent,
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
                                child: Hero(
                                  tag: snapshot.data.list[index].id.toString(),
                                  child: new Card(
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: ListTile(
                                        dense: true,
                                        title: Text(
                                            snapshot.data.list[index].category,
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
                                                      new BorderRadius.circular(
                                                          25.0),
                                                ),
                                                alignment: Alignment.center,
                                                child: new Text(
                                                  "C",
                                                  style: TextStyle(
                                                    fontSize: 23.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: "PoppinsLight",
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                width: 60,
                                                height: 60,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      snapshot.data.list[index]
                                                          .file),
                                                  radius: 20.0,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                        // trailing: Icon(Icons.arrow_forward_ios_sharp,
                                        //     color: Colors.green),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProtectionCategory(
                                                        snapshot.data
                                                            .list[index].id,
                                                        snapshot.data
                                                            .list[index].file,
                                                        snapshot
                                                            .data
                                                            .list[index]
                                                            .category,
                                                      )));
                                        },
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
            ),
            // actions: <Widget>[
            //   MaterialButton(
            //     minWidth: 200.0,
            //     color: Colors.red,
            //     child:
            //     Text('Cancel', style: TextStyle(color: Colors.white,fontFamily: "PoppinsMedium",fontWeight: FontWeight.bold)),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ],
          );
        });
  }

  Future<Protection> getProtection() async {
    // final param = {
    //   "category_id": widget.catId,
    //   "zone": widget.zone,
    //   "subcategory_id": widget.subId,
    // };

    final res = await http.post(
      Uri.parse(api2),
      // body: param,
    );

    print(res.body);
    print(res.statusCode);
    if (200 == res.statusCode) {
      print(protectionFromJson(res.body).list.length);
      return protectionFromJson(res.body);
    } else {
      throw Exception('Failed to load List');
    }
  }

  //production technology
  void _showProductionDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10.0,
            title: Text(
              production,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w800,
                  fontSize: 15.0,
                  fontFamily: "PoppinsMedium"),
            ),
            content: Container(
              height: 500.0,
              width: 300.0,
              child: FutureBuilder<Production>(
                future: getProduction(),
                builder:
                    (BuildContext context, AsyncSnapshot<Production> snapshot) {
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
                          _controller.animateTo(
                              _controller.position.minScrollExtent,
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
                                child: Hero(
                                  tag: snapshot.data.list[index].id.toString(),
                                  child: new Card(
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: ListTile(
                                        dense: true,
                                        title: Text(
                                            snapshot.data.list[index].category,
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
                                                      new BorderRadius.circular(
                                                          25.0),
                                                ),
                                                alignment: Alignment.center,
                                                child: new Text(
                                                  "C",
                                                  style: TextStyle(
                                                    fontSize: 23.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: "PoppinsLight",
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                width: 60,
                                                height: 60,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      snapshot.data.list[index]
                                                          .file),
                                                  radius: 20.0,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                        // trailing: Icon(Icons.arrow_forward_ios_sharp,
                                        //     color: Colors.green),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WebViewPage2(
                                                        snapshot.data
                                                            .list[index].id,
                                                        snapshot
                                                            .data
                                                            .list[index]
                                                            .category,
                                                        snapshot.data
                                                            .list[index].file,
                                                        snapshot
                                                            .data
                                                            .list[index]
                                                            .details,
                                                        snapshot.data
                                                            .list[index].north,
                                                        snapshot.data
                                                            .list[index].south,
                                                        snapshot
                                                            .data
                                                            .list[index]
                                                            .central,
                                                      )));
                                        },
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
            ),
            // actions: <Widget>[
            //   MaterialButton(
            //     minWidth: 200.0,
            //     color: Colors.red,
            //     child:
            //     Text('Cancel', style: TextStyle(color: Colors.white,fontFamily: "PoppinsMedium",fontWeight: FontWeight.bold)),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ],
          );
        });
  }

  Future<Production> getProduction() async {
    // final param = {
    //   "category_id": widget.catId,
    //   "zone": widget.zone,
    //   "subcategory_id": widget.subId,
    // };

    final res = await http.post(
      Uri.parse(api3),
      // body: param,
    );

    print(res.body);
    print(res.statusCode);
    if (200 == res.statusCode) {
      print(productionFromJson(res.body).list.length);
      return productionFromJson(res.body);
    } else {
      throw Exception('Failed to load List');
    }
  }

//  Facts and Figures

  void _showFactsAndFigureDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10.0,
            title: Text(
              facts,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w800,
                  fontSize: 15.0,
                  fontFamily: "PoppinsMedium"),
            ),
            content: Container(
              height: 300.0,
              width: 300.0,
              child: FutureBuilder<Facts>(
                future: getFacts(),
                builder: (BuildContext context, AsyncSnapshot<Facts> snapshot) {
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
                          _controller.animateTo(
                              _controller.position.minScrollExtent,
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
                                child: Hero(
                                  tag: snapshot.data.list[index].id.toString(),
                                  child: new Card(
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: ListTile(
                                        dense: true,
                                        title: Text(
                                            snapshot.data.list[index].year,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontFamily: "PoppinsMedium",
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold)),
                                        // leading: (snapshot
                                        //     .data.list[index].file.isEmpty)
                                        //     ?
                                        leading: Container(
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
                                        ),
                                        //     : Container(
                                        //   width: 60,
                                        //   height: 60,
                                        //   child: CircleAvatar(
                                        //     backgroundImage: NetworkImage(
                                        //         snapshot.data.list[index].file),
                                        //     radius: 20.0,
                                        //     backgroundColor: Colors.white,
                                        //   ),
                                        // ),
                                        // trailing: Icon(Icons.arrow_forward_ios_sharp,
                                        //     color: Colors.green),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FactsAndFiguresYear(
                                                          snapshot.data
                                                              .list[index].id,
                                                          snapshot
                                                              .data
                                                              .list[index]
                                                              .year)));
                                        },
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
            ),
            // actions: <Widget>[
            //   MaterialButton(
            //     minWidth: 200.0,
            //     color: Colors.red,
            //     child:
            //     Text('Cancel', style: TextStyle(color: Colors.white,fontFamily: "PoppinsMedium",fontWeight: FontWeight.bold)),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ],
          );
        });
  }

  Future<Facts> getFacts() async {
    // final param = {
    //   "category_id": widget.catId,
    //   "zone": widget.zone,
    //   "subcategory_id": widget.subId,
    // };

    final res = await http.post(
      Uri.parse(apiFacts),
      // body: param,
    );

    print(res.body);
    print(res.statusCode);
    if (200 == res.statusCode) {
      print(factsFromJson(res.body).list.length);
      return factsFromJson(res.body);
    } else {
      throw Exception('Failed to load List');
    }
  }

//Farmer outreach
  void _showFarmerOutreachDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10.0,
            title: Text(
              protection,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w800,
                  fontSize: 15.0,
                  fontFamily: "PoppinsMedium"),
            ),
            content: Container(
              height: 150.0,
              width: 300.0,
              child: FutureBuilder<Farmer>(
                future: getFarmerOutreach(),
                builder:
                    (BuildContext context, AsyncSnapshot<Farmer> snapshot) {
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
                          _controller.animateTo(
                              _controller.position.minScrollExtent,
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
                                child: Hero(
                                  tag: snapshot.data.list[index].id.toString(),
                                  child: new Card(
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: ListTile(
                                        dense: true,
                                        title: Text(
                                            snapshot.data.list[index].category,
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
                                                      new BorderRadius.circular(
                                                          25.0),
                                                ),
                                                alignment: Alignment.center,
                                                child: new Text(
                                                  "C",
                                                  style: TextStyle(
                                                    fontSize: 23.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: "PoppinsLight",
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                width: 60,
                                                height: 60,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      snapshot.data.list[index]
                                                          .file),
                                                  radius: 20.0,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                        // trailing: Icon(Icons.arrow_forward_ios_sharp,
                                        //     color: Colors.green),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FarmerOutreachCat(
                                                        snapshot.data
                                                            .list[index].id,
                                                        snapshot.data
                                                            .list[index].file,
                                                        snapshot
                                                            .data
                                                            .list[index]
                                                            .category,
                                                      )));
                                        },
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
            ),
            // actions: <Widget>[
            //   MaterialButton(
            //     minWidth: 200.0,
            //     color: Colors.red,
            //     child:
            //     Text('Cancel', style: TextStyle(color: Colors.white,fontFamily: "PoppinsMedium",fontWeight: FontWeight.bold)),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ],
          );
        });
  }

  Future<Farmer> getFarmerOutreach() async {
    // final param = {
    //   "category_id": widget.catId,
    //   "zone": widget.zone,
    //   "subcategory_id": widget.subId,
    // };

    final res = await http.post(
      Uri.parse(apiFarmer),
      // body: param,
    );

    print(res.body);
    print(res.statusCode);
    if (200 == res.statusCode) {
      print(farmerFromJson(res.body).list.length);
      return farmerFromJson(res.body);
    } else {
      throw Exception('Failed to load List');
    }
  }

//  weekly advisory0

  void _showWeeklyAdvisory(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10.0,
            title: Text(
              protection,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w800,
                  fontSize: 15.0,
                  fontFamily: "PoppinsMedium"),
            ),
            content: Container(
              height: 500.0,
              width: 300.0,
              child: FutureBuilder<Farmer>(
                future: getFarmerOutreach(),
                builder:
                    (BuildContext context, AsyncSnapshot<Farmer> snapshot) {
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
                          _controller.animateTo(
                              _controller.position.minScrollExtent,
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
                                child: Hero(
                                  tag: snapshot.data.list[index].id.toString(),
                                  child: new Card(
                                    elevation: 2.0,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: ListTile(
                                        dense: true,
                                        title: Text(
                                            snapshot.data.list[index].category,
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
                                                      new BorderRadius.circular(
                                                          25.0),
                                                ),
                                                alignment: Alignment.center,
                                                child: new Text(
                                                  "C",
                                                  style: TextStyle(
                                                    fontSize: 23.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: "PoppinsLight",
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                width: 60,
                                                height: 60,
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      snapshot.data.list[index]
                                                          .file),
                                                  radius: 20.0,
                                                  backgroundColor: Colors.white,
                                                ),
                                              ),
                                        // trailing: Icon(Icons.arrow_forward_ios_sharp,
                                        //     color: Colors.green),
                                        onTap: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FarmerOutreachCat(
                                                        snapshot.data
                                                            .list[index].id,
                                                        snapshot.data
                                                            .list[index].file,
                                                        snapshot
                                                            .data
                                                            .list[index]
                                                            .category,
                                                      )));
                                        },
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
            ),
            // actions: <Widget>[
            //   MaterialButton(
            //     minWidth: 200.0,
            //     color: Colors.red,
            //     child:
            //     Text('Cancel', style: TextStyle(color: Colors.white,fontFamily: "PoppinsMedium",fontWeight: FontWeight.bold)),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //   ),
            // ],
          );
        });
  }

  Future<Farmer> getWeeklyAdvisory() async {
    // final param = {
    //   "category_id": widget.catId,
    //   "zone": widget.zone,
    //   "subcategory_id": widget.subId,
    // };

    final res = await http.post(
      Uri.parse(apiFarmer),
      // body: param,
    );

    print(res.body);
    print(res.statusCode);
    if (200 == res.statusCode) {
      print(farmerFromJson(res.body).list.length);
      return farmerFromJson(res.body);
    } else {
      throw Exception('Failed to load List');
    }
  }
}
