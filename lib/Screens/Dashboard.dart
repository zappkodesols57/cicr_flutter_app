import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {

  @override
  void initState() {
    autoFill();
  }

  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // language = prefs.getString("language");

    // switch (language) {
    //   case "Eng":
    //     drawer1 = "Discussion Forum";
    //     drawer2 = "Important Website";
    //     drawer3 = "Farmer Felicitation";
    //     drawer4 = "Success Story";
    //     drawer5 = "CICR Directory";
    //     drawer6 = "About App";
    //     drawer7 = "Settings";
    //
    //     break;
    //
    //   case "Mar":
    //     drawer1 = "चर्चा मंच";
    //     drawer2 = "महत्वाची वेबसाईट";
    //     drawer3 = "शेतकरी सत्कार";
    //     drawer4 = "यशोगाथा";
    //     drawer5 = "CICR निर्देशिका";
    //     drawer6 = "अॅप बद्दल";
    //     drawer7 = "सेटिंग्ज";
    //
    //     break;
    //
    //   case "Hin":
    //     drawer1 = "चर्चा मंच";
    //     drawer2 = "महत्वपूर्ण वेबसाइट";
    //     drawer3 = "किसान अभिनंदन";
    //     drawer4 = "सफलता की कहानी";
    //     drawer5 = "CICR निर्देशिका";
    //     drawer6 = "ऐप के बारे में";
    //     drawer7 = "समायोजन";
    //
    //     break;
    //
    //   case "Gu":
    //     drawer1 = "ચર્ચા મંચ";
    //     drawer2 = "મહત્વપૂર્ણ વેબસાઈટ";
    //     drawer3 = "ખેડૂત સન્માન";
    //     drawer4 = "સક્સેસ સ્ટોરી";
    //     drawer5 = "CICR ડિરેક્ટરી";
    //     drawer6 = "એપ્લિકેશન વિશે";
    //     drawer7 = "સેટિંગ્સ";
    //
    //     break;
    //
    //   case "Kan":
    //     drawer1 = "ಚರ್ಚಾ ವೇದಿಕೆ";
    //     drawer2 = "ಪ್ರಮುಖ ವೆಬ್‌ಸೈಟ್";
    //     drawer3 = "ರೈತ ಸನ್ಮಾನ";
    //     drawer4 = "ಯಶಸ್ಸಿನ ಕಥೆ";
    //     drawer5 = "CICR ಡೈರೆಕ್ಟರಿ";
    //     drawer6 = "ಅಪ್ಲಿಕೇಶನ್ ಬಗ್ಗೆ";
    //     drawer7 = "ಸಂಯೋಜನೆಗಳು";
    //
    //     break;
    //
    // }
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                            padding: EdgeInsets.all( 3.0),
                            width: 125.0,
                            child: Text("Varieties And Hybrid",textAlign: TextAlign.center,style: TextStyle(
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
                            child: Text("Production Technology",textAlign: TextAlign.center,style: TextStyle(
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
                            child: Text("Protection Technology",textAlign: TextAlign.center,style: TextStyle(
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
                            child: Text("Facts And Figures",textAlign: TextAlign.center,style: TextStyle(
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
                            child: Text("Farmers Outreach",textAlign: TextAlign.center,style: TextStyle(
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
                            child: Text("Weekly Report",textAlign: TextAlign.center,style: TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}