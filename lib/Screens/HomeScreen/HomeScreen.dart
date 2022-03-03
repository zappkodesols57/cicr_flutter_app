import 'dart:convert';
import 'dart:io';

import 'package:cicr_flutter_app/Model/Model_CicrDirectory.dart';
import 'package:cicr_flutter_app/Screens/Dashboard.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/AskMe.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/ContactUs.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/About%20App.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/CICR%20Directory.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/Discussion%20Forum.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/Farmer%20Felicitation.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/Important%20Website.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/Profile.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Drawer/Success%20Story.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Gallery.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/News.dart';
import 'package:cicr_flutter_app/Screens/HomeScreen/Weather.dart';
import 'package:cicr_flutter_app/Screens/UI/Language.dart';
import 'package:cicr_flutter_app/Screens/UI/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

//list of widgets to call ontap

  String drawer,
      drawer1,
      drawer2,
      drawer3,
      drawer4,
      drawer5,
      drawer6,
      drawer7,
      drawer8,
      drawer9,
      drawer10;

  String language, name, cityName, img, api;
  String home, ask, gallery, news, contact,exitApp,yes,no;
  String number;

  TextEditingController cityController = new TextEditingController();

  String file;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final widgetTitle = ["Home", "Ask Me", "Gallery", "News", "Contact Us"];

  @override
  void initState() {
    autoFill();
  }

  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");
    name = prefs.getString("fullName");
    number = prefs.getString("mobile");
    img = prefs.getString("profilePic");

    print(img);

    switch (language) {
      case "Eng":
        drawer = "Profile";
        drawer1 = "Discussion Forum";
        drawer2 = "Important Websites";
        drawer3 = "Farmer Felicitation";
        drawer4 = "Success Stories";
        drawer5 = "CICR Directory";
        drawer6 = "About App";
        drawer7 = "Change Password";
        drawer8 = "Logout";
        drawer9 = "Change Language";
        drawer10 = "Login";
        cityName = "Enter Your City Name";
        home = "Home";
        ask = "Ask Me";
        gallery = "Gallery";
        news = "News";
        contact = "Contact Us";
        exitApp = "Do you want to exit this app?";
        yes ="Yes";
        no = "No";
        api = "https://www.zappkode.com/cicr/english/webservices/cicr_directory/getDirectory";

        break;

      case "Mar":
        drawer = "प्रोफाइल";
        drawer1 = "चर्चा मंच";
        drawer2 = "महत्वाची वेबसाईट";
        drawer3 = "शेतकरी सत्कार";
        drawer4 = "यशोगाथा";
        drawer5 = "CICR निर्देशिका";
        drawer6 = "अॅप बद्दल";
        drawer7 = "पासवर्ड बदला";
        drawer8 = "बाहेर पडणे";
        drawer9 = "भाषा बदला";
        drawer10 = "लॉगिन करा";
        cityName = "तुमच्या शहराचे नाव एंटर करा";
        home = "मुख्यपृष्ठ";
        ask = "मला विचार";
        gallery = "गॅलरी";
        news = "बातम्या";
        contact = "आमच्याशी संपर्क साधा";
        exitApp = "तुम्हाला या अॅपमधून बाहेर पडायचे आहे का?";
        yes ="होय";
        no ="नाही";
        api = "https://www.zappkode.com/cicr/marathi/webservices/cicr_directory/getDirectory";

        break;

      case "Hin":
        drawer = "प्रोफ़ाइल";
        drawer1 = "चर्चा मंच";
        drawer2 = "महत्वपूर्ण वेबसाइट";
        drawer3 = "किसान अभिनंदन";
        drawer4 = "सफलता की कहानी";
        drawer5 = "CICR निर्देशिका";
        drawer6 = "ऐप के बारे में";
        drawer7 = "पासवर्ड बदलें";
        drawer8 = "लॉग आउट";
        drawer9 = "भाषा बदलें";
        drawer10 = "लॉग इन करें";
        cityName = "अपने शहर का नाम दर्ज करें";
        home = "घर";
        ask = "मुझसे पूछें";
        gallery = "गेलरी";
        news = "समाचार";
        contact = "संपर्क करें";
        exitApp = "क्या आप इस ऐप से बाहर निकलना चाहते हैं?";
        yes = "हां";
        no ="नहीं";
        api = "https://www.zappkode.com/cicr/hindi/webservices/cicr_directory/getDirectory";

        break;

      case "Gu":
        drawer = "પ્રોફાઇલ";
        drawer1 = "ચર્ચા મંચ";
        drawer2 = "મહત્વપૂર્ણ વેબસાઈટ";
        drawer3 = "ખેડૂત સન્માન";
        drawer4 = "સક્સેસ સ્ટોરી";
        drawer5 = "CICR ડિરેક્ટરી";
        drawer6 = "એપ્લિકેશન વિશે";
        drawer7 = "પાસવર્ડ બદલો";
        drawer8 = "લૉગ આઉટ";
        drawer9 = "ભાષા બદલો";
        drawer10 = "પ્રવેશ કરો";
        cityName = "તમારા શહેરનું નામ દાખલ કરો";
        home = "ઘર";
        ask = "મને પૂછો";
        gallery = "ગેલેરી";
        news = "સમાચાર";
        contact = "અમારો સંપર્ક કરો";
        exitApp = "શું તમે આ એપ્લિકેશનમાંથી બહાર નીકળવા માંગો છો?";
        yes = "હા";
        no = "ના";
        api = "https://www.zappkode.com/cicr/gujarati/webservices/cicr_directory/getDirectory";

        break;

      case "Kan":
        drawer = "ಪ್ರೊಫೈಲ್";
        drawer1 = "ಚರ್ಚಾ ವೇದಿಕೆ";
        drawer2 = "ಪ್ರಮುಖ ವೆಬ್ಸೈಟ್";
        drawer3 = "ರೈತ ಸನ್ಮಾನ";
        drawer4 = "ಯಶಸ್ಸಿನ ಕಥೆ";
        drawer5 = "CICR ಡೈರೆಕ್ಟರಿ";
        drawer6 = "ಅಪ್ಲಿಕೇಶನ್ ಬಗ್ಗೆ";
        drawer7 = "ಗುಪ್ತಪದವನ್ನು ಬದಲಿಸಿ";
        drawer8 = "ಲಾಗ್ ಔಟ್";
        drawer9 = "ಭಾಷೆ ಬದಲಿಸಿ";
        drawer10 = "ಲಾಗಿನ್";
        cityName = "ನಿಮ್ಮ ನಗರದ ಹೆಸರನ್ನು ನಮೂದಿಸಿ";
        home = "ಮನೆ";
        ask = "ನನ್ನನ್ನು ಕೇಳಿ";
        gallery = "ಗ್ಯಾಲರಿ";
        news = "ಸುದ್ದಿ";
        contact = "ನಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸಿ";
        exitApp = "ನೀವು ಈ ಅಪ್ಲಿಕೇಶನ್‌ನಿಂದ ನಿರ್ಗಮಿಸಲು ಬಯಸುವಿರಾ?";
        yes ="ಹೌದು";
        no ="ಸಂ";
        api = "https://www.zappkode.com/cicr/kannada/webservices/cicr_directory/getDirectory";

        break;
    }
    setState(() {});
    getCICRD();
  }

  @override
  Widget build(BuildContext context) {
    final widgetOptions = [
      new Dashboard(language),
      new AskMe(),
      new Gallery(),
      new News(),
      new TabContact(0),
    ];
    return WillPopScope(onWillPop: ()=> showExitApp(context),
     child: Scaffold(
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
                  height: 700.0,
                ),
                padding: EdgeInsets.only(right: 10),
              ),
              (name != "guest")
                  ? ListTile(
                      dense: true,
                      title: Text(drawer,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "PoppinsMedium")),
                      leading: Icon(
                        FontAwesomeIcons.solidUser,
                        color: Colors.green,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Profile(drawer,name, number, img)));
                      },
                    )
                  : ListTile(
                      dense: true,
                      title: Text(drawer10,
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "PoppinsMedium")),
                      leading: Icon(
                        FontAwesomeIcons.powerOff,
                        color: Colors.green,
                      ),
                      onTap: () async {
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.setString("userID", "");
                        preferences.setString("fullName", "");
                        preferences.setString("mobile", "");
                        preferences.setString("profilePic", "");
                        preferences.setString("isLogin", "");

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login_Page()),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
              Divider(
                color: Colors.green,
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
                          builder: (context) =>
                              DiscussionForum(drawer1, name)));
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
                  launch(file);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => CICRDirectory()));
                },
              ),
              Divider(
                color: Colors.green,
              ),
              ListTile(
                dense: true,
                title: Text(drawer9,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PoppinsMedium")),
                leading: Icon(
                  FontAwesomeIcons.language,
                  color: Colors.green,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Language(language)));
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
                      MaterialPageRoute(builder: (context) => TabAboutApp(0)));
                },
              ),
              Divider(
                color: Colors.green,
              ),
              if (name != "guest")
                ListTile(
                  dense: true,
                  title: Text(drawer8,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "PoppinsMedium")),
                  leading: Icon(
                    FontAwesomeIcons.powerOff,
                    color: Colors.green,
                  ),
                  onTap: () async {
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.setString("userID", "");
                    preferences.setString("fullName", "");
                    preferences.setString("mobile", "");
                    preferences.setString("profilePic", "");
                    preferences.setString("isLogin", "");

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login_Page()),
                      (Route<dynamic> route) => false,
                    );
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
              label: home),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.question_answer,
                color: Colors.white,
              ),
              label: ask),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.photo,
                color: Colors.white,
              ),
              label: gallery),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.event_note_outlined,
                color: Colors.white,
              ),
              label: news),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                color: Colors.white,
              ),
              label: contact),
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
    ));
  }

  Future<CICRDir> getCICRD() async {

    final res = await http.post(
      Uri.parse(api),

    );

    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      print(directoryFromJson(res.body).list.length);
      file = responseJson['path'][0]['file'];
      print(file);
      return directoryFromJson(res.body);
    } else {
      throw Exception('Failed to load List');
    }
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
              child: Text('Cancel',
                  style: TextStyle(
                      color: Colors.white, fontFamily: "PoppinsMedium")),
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            MaterialButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Text('Done',
                    style: TextStyle(
                        color: Colors.white, fontFamily: "PoppinsMedium")),
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
                    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Please Enter City",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: "PoppinsMedium"),
                        ),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2)));
                  }
                }),
          ],
        );
      },
    );
  }

  showExitApp(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: SingleChildScrollView(
                child: Container(
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exitApp),

                    ],
                  ),
                ),
              ),
              actions: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print('yes selected');
                      exit(0);
                    },
                    child: Text(yes),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade800),
                  ),
                ),
                Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print('no selected');
                        Navigator.of(context).pop();
                      },
                      child: Text(no, style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ))
              ],
            );
          });
    }
  }

