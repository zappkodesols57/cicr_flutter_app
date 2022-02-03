import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  String language;
  Dashboard(this.language);

  @override
  _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // String language;

  @override
  void initState() {
    autoFill();
  }

  String varieties,production,protection,facts,farmer,weekly;


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
        varieties = "Varieties And Hybrid";
        production = "Production Technology";
        protection = "Protection Technology";
        facts = "Facts And Figures";
        farmer = "Farmers Outreach";
        weekly = "Weekly Report";

        break;

      case "Mar":
        varieties = "वाण आणि संकरित";
        production = "उत्पादन तंत्रज्ञान";
        protection = "संरक्षण तंत्रज्ञान";
        facts = "तथ्ये आणि आकडेवारी";
        farmer = "शेतकरी पोहोच";
        weekly = "साप्ताहिक अहवाल";

        break;

      case "Hin":
        varieties = "किस्में और हाइब्रिड";
        production = "उत्पादन प्रौद्योगिकी";
        protection = "संरक्षण प्रौद्योगिकी";
        facts = "तथ्य और आंकड़े";
        farmer = "किसान आउटरीच";
        weekly = "साप्ताहिक विवरण";

        break;

      case "Gu":
        varieties = "જાતો અને હાઇબ્રિડ";
        production = "ઉત્પાદન ટેકનોલોજી";
        protection = "પ્રોટેક્શન ટેકનોલોજી";
        facts = "હકીકતો અને આંકડા";
        farmer = "ખેડૂતો આઉટરીચ";
        weekly = "અઠવાડિક અહેવાલ";

        break;

      case "Kan":
        varieties = "ಪ್ರಭೇದಗಳು ಮತ್ತು ಹೈಬ್ರಿಡ್";
        production = "ಉತ್ಪಾದನಾ ತಂತ್ರಜ್ಞಾನ";
        protection = "ರಕ್ಷಣೆ ತಂತ್ರಜ್ಞಾನ";
        facts = "ಸಂಗತಿಗಳು ಮತ್ತು ಅಂಕಿಅಂಶಗಳು";
        farmer = "ರೈತರ ಔಟ್ರೀಚ್";
        weekly = "ವಾರದ ವರದಿ";

        break;

    }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: Text("CICR"),
      // ),
      body:  SingleChildScrollView(
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
                    borderRadius:true ,
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
              SizedBox(height: 10.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                              child: Image.asset("assets/dashboard/agriculture.png",fit: BoxFit.cover,height: 70.0,width: 70.0,)),
                          Container(
                            margin: EdgeInsets.only(bottom: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.green,
                            ),
                            // height: 20.0,
                            padding: EdgeInsets.all(3.0),
                            width: 125.0,
                            child: Text(varieties??"",textAlign: TextAlign.center,style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Container(
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
                              child: Image.asset("assets/dashboard/agriculture2.png",fit: BoxFit.cover,height: 70.0,width: 70.0,)),
                          Container(
                            margin: EdgeInsets.only(bottom: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.green,
                            ),
                            // height: 20.0,
                            padding: EdgeInsets.all( 3.0),
                            width: 125.0,
                            child: Text(production??"",textAlign: TextAlign.center,style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),


              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                              child: Image.asset("assets/dashboard/agriculture3.png",fit: BoxFit.cover,height: 70.0,width: 70.0,)),
                          Container(
                            margin: EdgeInsets.only(bottom: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.green,
                            ),
                            // height: 20.0,
                            padding: EdgeInsets.all( 3.0),
                            width: 125.0,
                            child: Text(protection??"",textAlign: TextAlign.center,style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Container(
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
                              child: Image.asset("assets/dashboard/agriculture4.png",fit: BoxFit.cover,height: 70.0,width: 70.0,)),
                          Container(
                            margin: EdgeInsets.only(bottom: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.green,
                            ),
                            // height: 20.0,
                            padding: EdgeInsets.all( 3.0),
                            width: 125.0,
                            child: Text(facts??"",textAlign: TextAlign.center,style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),


              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                              child: Image.asset("assets/dashboard/agriculture5.png",fit: BoxFit.cover,height: 70.0,width: 70.0,)),
                          Container(
                            margin: EdgeInsets.only(bottom: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.green,
                            ),
                            // height: 20.0,
                            padding: EdgeInsets.all( 3.0),
                            width: 125.0,
                            child: Text(farmer??"",textAlign: TextAlign.center,style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold
                            ),),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Container(
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
                              child: Image.asset("assets/dashboard/agriculture6.png",fit: BoxFit.cover,height: 70.0,width: 70.0,)),
                          Container(
                            margin: EdgeInsets.only(bottom: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.green,
                            ),
                            // height: 20.0,
                            padding: EdgeInsets.all( 3.0),
                            width: 125.0,
                            child: Text(weekly??"",textAlign: TextAlign.center,style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
                        ],
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
}