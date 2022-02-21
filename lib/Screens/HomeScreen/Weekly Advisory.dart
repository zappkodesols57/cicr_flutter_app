import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'WeeklyDetails.dart';



class WeeklyAdvisory extends StatefulWidget {
  const WeeklyAdvisory({Key key}) : super(key: key);

  @override
  _WeeklyAdvisoryState createState() => _WeeklyAdvisoryState();
}

class _WeeklyAdvisoryState extends State<WeeklyAdvisory> {
  String api,city1,city2,city3,city4,city5,city6,city7,city8,city9,city10,city11,week;
  String language;


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
        city1 = "Gujarat";
        city2 = "Maharashtra";
        city3 = "Telangana";
        city4 = "Andhra Pradesh";
        city5 = "Karnataka";
        city6 = "Tamil Nadu";
        city7 = "Madhya Pradesh";
        city8 = "Odisha";
        city9 = "Rajasthan";
        city10 = "Haryana";
        city11 = "Punjab";
        week= "Weekly Advisory";

        break;

      case "Mar":
        city1 = "गुजरात";
        city2 = "महाराष्ट्र";
        city3 = "तेलंगणा";
        city4 = "आंध्र-प्रदेश";
        city5 = "कर्नाटक";
        city6 = "तामिळ-नाडू";
        city7 = "मध्य-प्रदेश";
        city8 = "ओडिशा";
        city9 = "राजस्थान";
        city10 = "हरियाणा";
        city11 = "पंजाब";
        week ="साप्ताहिक सल्लागार";
        break;

      case "Hin":
        city1 = "गुजरात";
        city2 = "महाराष्ट्र";
        city3 = "तेलंगाना";
        city4 = "आंध्र प्रदेश";
        city5 = "कर्नाटक";
        city6 = "तमिलनाडु";
        city7 = "मध्य प्रदेश";
        city8 = "उड़ीसा";
        city9 = "राजस्थान ";
        city10 = "हरयाणा";
        city11 = "पंजाब";
        week ="साप्ताहिक सलाह";
        break;

      case "Gu":
        city1 = "ગુજરાત";
        city2 = "મહારાષ્ટ્ર";
        city3 = "તેલંગાણા";
        city4 = "આંધ્ર-પ્રદેશ";
        city5 = "કર્ણાટક";
        city6 = "તમિલ-નાડુ";
        city7 = "મધ્ય-પ્રદેશ";
        city8 = "ઓડિશા";
        city9 = "રાજસ્થાન";
        city10 = "હરિયાણા";
        city11 = "પંજાબ";
        week = "સાપ્તાહિક સલાહ";
        break;

      case "Kan":
        city1 = "ಗುಜರಾತ್";
        city2 = "ಮಹಾರಾಷ್ಟ್ರ";
        city3 = "ತೆಲಂಗಾಣ";
        city4 = "ಆಂಧ್ರ-ಪ್ರದೇಶ";
        city5 = "ಕರ್ನಾಟಕ";
        city6 = "ತಮಿಳು-ನಾಡು";
        city7 = "ಮಧ್ಯ-ಪ್ರದೇಶ";
        city8 = "ಒಡಿಶಾ";
        city9 = "ರಾಜಸ್ಥಾನ";
        city10 = "ಹರಿಯಾಣ";
        city11 = "ಪಂಜಾಬ್";
        week = "ಸಾಪ್ತಾಹಿಕ ಸಲಹೆ";
        break;

    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        title: Text(week),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeeklyDetails(city1
                                  )));
                    },
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(alignment: Alignment.center,
                            image: AssetImage("assets/weekly/gujrat1.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:130.0),
                          child: Text(city1,textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeeklyDetails(city2
                                  )));
                    },
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(alignment: Alignment.center,
                            image: AssetImage("assets/weekly/maharashtra1.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:130.0),
                          child: Text(city2,textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeeklyDetails(city3
                                  )));
                    },
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(alignment: Alignment.center,
                            image: AssetImage("assets/weekly/telangana3.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:130.0),
                          child: Text(city3,textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeeklyDetails(city4
                                  )));
                    },
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(alignment: Alignment.center,
                            image: AssetImage("assets/weekly/andhra3.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:130.0),
                          child: Expanded(child: Text(city4,textAlign: TextAlign.center,)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeeklyDetails(city5
                                  )));
                    },
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(alignment: Alignment.center,
                            image: AssetImage("assets/weekly/karnataka3.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:130.0),
                          child: Text(city5,textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeeklyDetails(city5
                                  )));
                    },
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(alignment: Alignment.center,
                            image: AssetImage("assets/weekly/tamilnadu3.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:130.0),
                          child: Text(city6,textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeeklyDetails(city7
                                  )));
                    },
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(alignment: Alignment.center,
                            image: AssetImage("assets/weekly/madhyapradesh.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:130.0),
                          child: Text(city7,textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeeklyDetails(city8
                                  )));
                    },
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(alignment: Alignment.center,
                            image: AssetImage("assets/weekly/odisha3.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:130.0),
                          child: Text(city8,textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeeklyDetails(city9
                                  )));
                    },
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(alignment: Alignment.center,
                            image: AssetImage("assets/weekly/rajasthan3.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:130.0),
                          child: Text(city9,textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeeklyDetails(city10
                                  )));
                    },
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(alignment: Alignment.center,
                            image: AssetImage("assets/weekly/haryana3.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:130.0),
                          child: Text(city10,textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WeeklyDetails(city11
                                  )));
                    },
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(alignment: Alignment.center,
                            image: AssetImage("assets/weekly/punjab3.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:130.0),
                          child: Text(city11,textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        ),
      ),
    );
  }
}

