import 'package:cicr_flutter_app/Screens/UI/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Language extends StatefulWidget {
  const Language({Key key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}


class _LanguageState extends State<Language> {
  SharedPreferences language;



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
    language = prefs;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Select The Language"),
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login_Page()),
                        (Route<dynamic> route) => false,
                  );
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login_Page()),
                        (Route<dynamic> route) => false,
                  );
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login_Page()),
                        (Route<dynamic> route) => false,
                  );
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

                    language.setString("language", "Guj");

                  });
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login_Page()),
                        (Route<dynamic> route) => false,
                  );
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login_Page()),
                        (Route<dynamic> route) => false,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
