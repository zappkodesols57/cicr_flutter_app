import 'package:cicr_flutter_app/Screens/Dashboard.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/AskMe.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/ContactUs.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/About%20App.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/CICR%20Directory.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/Discussion%20Forum.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/Farmer%20Felicitation.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/Important%20Website.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/Settings.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/Success%20Story.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Gallery.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/News.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  //list of widgets to call ontap

  String drawer1, drawer2, drawer3, drawer4, drawer5, drawer6, drawer7;

  String language, cityName;

  TextEditingController cityController = new TextEditingController();

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetTitle = ["Home", "Ask Me", "Contact Us", "Gallery", "News"];

  @override
  void initState() {
    autoFill();
  }

  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");

    switch (language) {
      case "Eng":
        drawer1 = "Discussion Forum";
        drawer2 = "Important Website";
        drawer3 = "Farmer Felicitation";
        drawer4 = "Success Story";
        drawer5 = "CICR Directory";
        drawer6 = "About App";
        drawer7 = "Settings";
        cityName = "Enter Your City Name";

        break;

      case "Mar":
        drawer1 = "चर्चा मंच";
        drawer2 = "महत्वाची वेबसाईट";
        drawer3 = "शेतकरी सत्कार";
        drawer4 = "यशोगाथा";
        drawer5 = "CICR निर्देशिका";
        drawer6 = "अॅप बद्दल";
        drawer7 = "सेटिंग्ज";
        cityName = "तुमच्या शहराचे नाव एंटर करा";

        break;

      case "Hin":
        drawer1 = "चर्चा मंच";
        drawer2 = "महत्वपूर्ण वेबसाइट";
        drawer3 = "किसान अभिनंदन";
        drawer4 = "सफलता की कहानी";
        drawer5 = "CICR निर्देशिका";
        drawer6 = "ऐप के बारे में";
        drawer7 = "समायोजन";
        cityName = "अपने शहर का नाम दर्ज करें";

        break;

      case "Gu":
        drawer1 = "ચર્ચા મંચ";
        drawer2 = "મહત્વપૂર્ણ વેબસાઈટ";
        drawer3 = "ખેડૂત સન્માન";
        drawer4 = "સક્સેસ સ્ટોરી";
        drawer5 = "CICR ડિરેક્ટરી";
        drawer6 = "એપ્લિકેશન વિશે";
        drawer7 = "સેટિંગ્સ";
        cityName = "તમારા શહેરનું નામ દાખલ કરો";

        break;

      case "Kan":
        drawer1 = "ಚರ್ಚಾ ವೇದಿಕೆ";
        drawer2 = "ಪ್ರಮುಖ ವೆಬ್‌ಸೈಟ್";
        drawer3 = "ರೈತ ಸನ್ಮಾನ";
        drawer4 = "ಯಶಸ್ಸಿನ ಕಥೆ";
        drawer5 = "CICR ಡೈರೆಕ್ಟರಿ";
        drawer6 = "ಅಪ್ಲಿಕೇಶನ್ ಬಗ್ಗೆ";
        drawer7 = "ಸಂಯೋಜನೆಗಳು";
        cityName = "ನಿಮ್ಮ ನಗರದ ಹೆಸರನ್ನು ನಮೂದಿಸಿ";

        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final widgetOptions = [
      new Dashboard(language),
      new AskMe(),
      new ContactUs(),
      new Gallery(),
      new News(),
    ];
    return new Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      appBar: AppBar(
        title: Text("CICR"),
        actions: [
          IconButton(
            onPressed: () {
              _showAlertDialog(context);
            },
            icon: Icon(FontAwesomeIcons.cloudSunRain),
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      drawer: Container(
        width: 260,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.only(left: 10, right: 10),
            children: [
              DrawerHeader(
                child: Image.asset(
                  "assets/logo.png",
                  height: 120.0,
                ),
                padding: EdgeInsets.only(right: 10),
              ),
              ListTile(
                dense: true,
                title: Text(drawer1,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PoppinsMedium")),
                leading: Icon(
                  FontAwesomeIcons.solidComments,
                  color: Colors.green,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DiscussionForum()));
                },
              ),
              Divider(
                color: Colors.green,
              ),
              ListTile(
                dense: true,
                title: Text(drawer2,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PoppinsMedium")),
                leading: Icon(
                  FontAwesomeIcons.globe,
                  color: Colors.green,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ImpWebsite()));
                },
              ),
              Divider(
                color: Colors.green,
              ),
              ListTile(
                dense: true,
                title: Text(drawer3,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PoppinsMedium")),
                leading: Icon(
                  FontAwesomeIcons.tree,
                  color: Colors.green,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Felicitation()));
                },
              ),
              Divider(
                color: Colors.green,
              ),
              ListTile(
                dense: true,
                title: Text(drawer4,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PoppinsMedium")),
                leading: Icon(
                  FontAwesomeIcons.trophy,
                  color: Colors.green,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SuccessStory()));
                },
              ),
              Divider(
                color: Colors.green,
              ),
              ListTile(
                dense: true,
                title: Text(drawer5,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PoppinsMedium")),
                leading: Icon(
                  FontAwesomeIcons.book,
                  color: Colors.green,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CICRDirectory()));
                },
              ),
              Divider(
                color: Colors.green,
              ),
              ListTile(
                dense: true,
                title: Text(drawer6,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PoppinsMedium")),
                leading: Icon(
                  FontAwesomeIcons.info,
                  color: Colors.green,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutApp()));
                },
              ),
              Divider(
                color: Colors.green,
              ),
              ListTile(
                dense: true,
                title: Text(drawer7,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PoppinsMedium")),
                leading: Icon(
                  FontAwesomeIcons.tools,
                  color: Colors.green,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.question_answer,
                color: Colors.white,
              ),
              label: "Ask Me"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                color: Colors.white,
              ),
              label: "Contact Us"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.photo,
                color: Colors.white,
              ),
              label: "Gallery"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.event_note_outlined,
                color: Colors.white,
              ),
              label: "News"),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        fixedColor: Colors.white,
        onTap: onItemTapped,
        selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 13),
        unselectedFontSize: 12,
        selectedIconTheme:
            IconThemeData(color: Colors.white, opacity: 1.0, size: 24.0),
        unselectedIconTheme:
            IconThemeData(color: Colors.white70, size: 15.0, opacity: 2.0),
        unselectedItemColor: Colors.white70,
        unselectedLabelStyle: TextStyle(fontSize: 10, color: Colors.white),
        backgroundColor: Colors.green,
      ),
    );
  }

  _showAlertDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            cityName,
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w800,
                fontSize: 15.0,
                fontFamily: "PoppinsMedium"),
          ),
          content: Container(
            height: 70,
            width: 350,
            child: Column(
              children: [
                Container(
                  width: size.width * 0.99,
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 0.0, left: 10.0, right: 10.0),
                  child: TextField(
                    controller: cityController,
                    keyboardType: TextInputType.text,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                      LengthLimitingTextInputFormatter(20)
                    ],
                    style: TextStyle(
                        fontFamily: "PoppinsLight",
                        fontSize: 13.0,
                        color: Colors.green),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterStyle: TextStyle(
                        height: double.minPositive,
                      ),
                      counterText: "",
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 13.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 0.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(35.0)),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 0.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(35.0)),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.city,
                        color: Colors.green,
                        size: 20.0,
                      ),
                      labelText: "City",
                      labelStyle: TextStyle(
                          fontFamily: "PoppinsLight",
                          fontSize: 13.0,
                          color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.white, fontFamily: "PoppinsMedium")),
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            MaterialButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text('Done', style: TextStyle(color: Colors.white, fontFamily: "PoppinsMedium")),
                onPressed: () {
                  if (cityController.text.isNotEmpty) {
                    Navigator.of(context).pop();
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Weather(cityController.text)))
                        .then((value) => cityController.clear());
                  } else {
                    return null;
                  }
                }),
          ],
        );
      },
    );
  }
}
