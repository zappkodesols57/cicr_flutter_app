import 'package:cicr_flutter_app/Screens/HomeScreen/HomeScreen.dart';
import 'package:cicr_flutter_app/Screens/UI/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language extends StatefulWidget {
  const Language({Key key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  SharedPreferences language;
  String _isLogin;


  @override
  void initState() {
    getCredentials();
  }

  bool _english = false;
  bool _marathi = false;
  bool _hindi = false;
  bool _gujarati = false;
  bool _kannada = false;



  getCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLogin = prefs.getString("isLogin");
    language = prefs;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Select The Language"),
        leading:  ( _isLogin == "1") ? IconButton(
          onPressed: () {
              Navigator.pop(context);

          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        )
        : SizedBox(
          width: 0.1,
        ),
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green,width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage( image: AssetImage("assets/logo.png"),
              colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.15), BlendMode.dstATop)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: Text("English",
              style: TextStyle(
                  fontFamily: "PoppinsMedium",
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 25.0),
              ),
              leading: Checkbox(
                value: _english,
                activeColor: Colors.green,
                onChanged: (bool value) {
                  setState(() {
                    _english = value;
                     _marathi = false;
                     _hindi = false;
                    _gujarati = false;
                     _kannada = false;

                     language.setString("language", "Eng");

                  });
                },
              ),
            ),
            ListTile(
              title: Text("मराठी",
                style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 25.0),
              ),
              leading: Checkbox(
                value: _marathi,
                activeColor: Colors.green,
                onChanged: (bool value) {
                  setState(() {
                    _marathi = value;
                    _english = false;
                    _hindi = false;
                    _gujarati = false;
                    _kannada = false;

                    language.setString("language", "Mar");

                  });
                },
              ),
            ),
            ListTile(
              title: Text("हिन्दी",
                style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 25.0),
              ),
              leading: Checkbox(
                value: _hindi,
                activeColor: Colors.green,
                onChanged: (bool value) {
                  setState(() {
                    _hindi = value;
                    _english = false;
                    _marathi = false;
                    _gujarati = false;
                    _kannada = false;

                    language.setString("language", "Hin");

                  });
                },
              ),
            ),
            ListTile(
              title: Text("ગુજરાતી",
                style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 25.0),
              ),
              leading: Checkbox(
                value: _gujarati,
                activeColor: Colors.green,
                onChanged: (bool value) {
                  setState(() {
                    _gujarati = value;
                    _english = false;
                    _marathi = false;
                    _hindi = false;
                    _kannada = false;

                    language.setString("language", "Gu");

                  });
                },
              ),
            ),
            ListTile(
              title: Text("ಕನ್ನಡ",
                style: TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 25.0),
              ),
              leading: Checkbox(
                value: _kannada,
                activeColor: Colors.green,
                onChanged: (bool value) {
                  setState(() {
                    _kannada = value;
                    _english = false;
                    _marathi = false;
                    _hindi = false;
                    _gujarati = false;

                    language.setString("language", "Kan");

                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 20.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 20.0,
                  ),
                ],
                gradient: new LinearGradient(
                    colors: [
                      Colors.green.shade600,
                      Colors.green,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: MaterialButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      "Select",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontFamily: "PoppinsBold"),
                    ),
                  ),
                  onPressed: () {
                    if(_isLogin == null || _isLogin == "")
                    {
                      if (_english == true || _marathi == true ||
                          _hindi == true || _gujarati == true ||
                          _kannada == true) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login_Page()),
                              (Route<dynamic> route) => false,
                        );
                      } else {
                        showInSnackBar("Please Select Language");
                        return null;
                      }
                    }
                    else
                    if (_english == true || _marathi == true ||
                        _hindi == true || _gujarati == true ||
                        _kannada == true){
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                              (Route<dynamic> route) => false,
                        );
                      } else
                        showInSnackBar("Please Select Language");
                    return null;
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 16.0, fontFamily: "PoppinsMedium"),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    ));
  }

}
