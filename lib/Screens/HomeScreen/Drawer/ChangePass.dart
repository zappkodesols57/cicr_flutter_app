import 'dart:convert';
import 'package:cicr_flutter_app/Screens/UI/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ChangePass extends StatefulWidget {
  const ChangePass({Key key}) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController oldPassController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  final FocusNode myFocusNodeOldPass = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodePasswordConfirm = FocusNode();


  bool _obscureTextOldPass = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;
  String id,language,api,user;
  String appBar,oldPass,newpass,confpass,update;
  String snack1,snack2,snack3,snack4,snack5;
  String Invalid_Mobile_Number,server_error,passSuccess;


  @override
  void initState() {
    autoFill();
    super.initState();
  }

  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");

    switch (language) {
      case "Eng":
        appBar = "Change Password";
        oldPass = "Old Password *";
        newpass = "New Password *";
        confpass = "Confirm New Password *";
        update = "Update";

        Invalid_Mobile_Number = "Invalid Mobile Number or Password";
        server_error = "Server Error";
        passSuccess = "Password changed successfully";

        snack1 = "Please enter Old Password";
        snack2 = "Please enter New Password";
        snack3 = "Please enter Confirm Password";
        snack4 = "Password must contain at least 8 characters";
        snack5 = "Password not match";
        api = "https://www.zappkode.com/cicr/english/webservices/farmerregistration/profileChangePassword";

        break;

      case "Mar":
        appBar = "पासवर्ड बदला";
        oldPass = "जुना पासवर्ड *";
        newpass = "नवीन पासवर्ड *";
        confpass = "नवीन परवलीच्या शब्दाची खात्री करा *";
        update = "अपडेट करा";

        Invalid_Mobile_Number = "अवैध मोबाईल नंबर किंवा पासवर्ड";
        server_error = "सर्व्हर त्रुटी";
        passSuccess = "पासवर्ड यशस्वीरित्या बदलला";

        snack1 = "कृपया जुना पासवर्ड टाका";
        snack2 = "कृपया नवीन पासवर्ड टाका";
        snack3 = "कृपया पासवर्ड कन्फर्म करा";
        snack4 = "पासवर्डमध्ये किमान 8 वर्ण असणे आवश्यक आहे";
        snack5 = "पासवर्ड जुळत नाही";
        api = "https://www.zappkode.com/cicr/marathi/webservices/farmerregistration/profileChangePassword";

        break;

      case "Hin":
        appBar = "पासवर्ड बदलें";
        oldPass = "पुराना पासवर्ड *";
        newpass = "नया पासवर्ड *";
        confpass = "नए पासवर्ड की पुष्टि करें *";
        update = "अद्यतन";

        Invalid_Mobile_Number = "अमान्य मोबाइल नंबर या पासवर्ड";
        server_error = "सर्वर त्रुटि";
        passSuccess = "पासवर्ड सफलतापूर्वक बदला गया";

        snack1 = "कृपया पुराना पासवर्ड दर्ज करें";
        snack2 = "कृपया नया पासवर्ड दर्ज करें";
        snack3 = "कृपया पासवर्ड की पुष्टि करें दर्ज करें";
        snack4 = "पासवर्ड में कम से कम 8 अक्षर होने चाहिए";
        snack5 = "पासवर्ड मेल नहीं खाता";
        api = "https://www.zappkode.com/cicr/marathi/webservices/farmerregistration/profileChangePassword";

        break;

      case "Gu":
        appBar = "પાસવર્ડ બદલો";
        oldPass = "જુનો પાસવર્ડ *";
        newpass = "નવો પાસવર્ડ *";
        confpass = "નવાપાસવર્ડની પુષ્ટી કરો *";
        update = "અપડેટ કરો";

        Invalid_Mobile_Number = "અમાન્ય મોબાઇલ નંબર અથવા પાસવર્ડ";
        server_error = "સર્વર ભૂલ";
        passSuccess = "પાસવર્ડ સફળતાપૂર્વક બદલાયો";

        snack1 = "કૃપા કરીને જૂનો પાસવર્ડ દાખલ કરો";
        snack2 = "કૃપા કરીને નવો પાસવર્ડ દાખલ કરો";
        snack3 = "કૃપા કરીને કન્ફર્મ પાસવર્ડ દાખલ કરો";
        snack4 = "પાસવર્ડમાં ઓછામાં ઓછા 8 અક્ષરો હોવા જોઈએ";
        snack5 = "પાસવર્ડ મેળ ખાતો નથી";
        api = "https://www.zappkode.com/cicr/gujarati/webservices/farmerregistration/profileChangePassword";

        break;

      case "Kan":
        appBar = "ಗುಪ್ತಪದವನ್ನು ಬದಲಿಸಿ";
        oldPass = "ಹಳೆಯ ಪಾಸ್ವರ್ಡ್ *";
        newpass = "ಹೊಸ ಪಾಸ್ವರ್ಡ್ *";
        confpass = "ಹೊಸ ಗುಪ್ತಪದವನ್ನು ಖಚಿತಪಡಿಸಿ *";
        update = "ನವೀಕರಿಸಿ";

        Invalid_Mobile_Number = "ಅಮಾನ್ಯ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ಅಥವಾ ಪಾಸ್‌ವರ್ಡ್";
        server_error = "ಸರ್ವರ್ ದೋಷ";
        passSuccess = "ಪಾಸ್ವರ್ಡ್ ಯಶಸ್ವಿಯಾಗಿ ಬದಲಾಗಿದೆ";

        snack1 = "ದಯವಿಟ್ಟು ಹಳೆಯ ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಿ";
        snack2 = "ದಯವಿಟ್ಟು ಹೊಸ ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಿ";
        snack3 = "ದಯವಿಟ್ಟು ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ದೃಢೀಕರಿಸಿ ನಮೂದಿಸಿ";
        snack4 = "ಪಾಸ್ವರ್ಡ್ ಕನಿಷ್ಠ 8 ಅಕ್ಷರಗಳನ್ನು ಹೊಂದಿರಬೇಕು";
        snack5 = "ಪಾಸ್ವರ್ಡ್ ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ";
        api = "https://www.zappkode.com/cicr/kannada/webservices/farmerregistration/profileChangePassword";


        break;

    }
    setState(() {});
  }


  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    myFocusNodePassword.dispose();
    myFocusNodePasswordConfirm.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(appBar.toString()),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: size.width * 0.85,
              padding: EdgeInsets.only(
                  top: 0.0, bottom: 40.0, left: 40.0, right: 40.0),
              child: new Image(
                  width: size.width * 0.5,
                  height: size.height * 0.3,
                  image: new AssetImage('assets/logo.png')),
            ),
            Column(
              children: [
                Container(
                  width: size.width * 0.99,
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 0.0, left: 15.0, right: 15.0),
                  child: TextField(
                    focusNode: myFocusNodeOldPass,
                    controller: oldPassController,
                    obscureText: _obscureTextOldPass,
                    onSubmitted: (value){
                      // validatePassword(value) ? showInSnackBar('Valid Password', 2) : showInSnackBar(warn, 8);
                    },
                    style: TextStyle(
                        fontFamily: "PoppinsLight",
                        fontSize: 13.0,
                        color: Colors.green),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 0.5,),
                        borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 0.5),
                        borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.lock,
                        size: 20.0,
                        color: Colors.green,
                      ),
                      hintText: oldPass,
                      hintStyle: TextStyle(
                          fontFamily: "PoppinsLight", fontSize: 13.0, color: Colors.green),
                      suffixIcon: GestureDetector(
                         onTap: _toggleOld,
                        child: Icon(
                          _obscureTextSignup
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          size: 13.0,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),


                Container(
                  width: size.width * 0.99,
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 0.0, left: 15.0, right: 15.0),
                  child: TextField(
                    focusNode: myFocusNodePassword,
                    controller: passwordController,
                    obscureText: _obscureTextSignup,
                    onSubmitted: (value){
                      // validatePassword(value) ? showInSnackBar('Valid Password', 2) : showInSnackBar(warn, 8);
                    },
                    style: TextStyle(
                        fontFamily: "PoppinsLight",
                        fontSize: 13.0,
                        color: Colors.green),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 0.5,),
                        borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 0.5),
                        borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.lock,
                        size: 20.0,
                        color: Colors.green,
                      ),
                      hintText: newpass,
                      hintStyle: TextStyle(
                          fontFamily: "PoppinsLight", fontSize: 13.0, color: Colors.green),
                      suffixIcon: GestureDetector(
                         onTap: _toggleSignup,
                        child: Icon(
                          _obscureTextSignup
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          size: 13.0,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.99,
                  padding: EdgeInsets.only(
                      top: 10.0, bottom: 0.0, left: 15.0, right: 15.0),
                  child: TextField(
                    focusNode: myFocusNodePasswordConfirm,
                    controller: confirmPasswordController,
                    obscureText: _obscureTextSignupConfirm,
                    style: TextStyle(
                        fontFamily: "PoppinsLight",
                        fontSize: 13.0,
                        color: Colors.green),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 0.5,),
                        borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 0.5),
                        borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.lock,
                        size: 20.0,
                        color: Colors.green,
                      ),
                      hintText: confpass,
                      hintStyle: TextStyle(
                          fontFamily: "PoppinsLight", fontSize: 13.0, color: Colors.green),
                      suffixIcon: GestureDetector(
                         onTap: _toggleSignupConfirm,
                        child: Icon(
                          _obscureTextSignupConfirm
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          size: 13.0,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
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
                    child: Text(update,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontFamily: "PoppinsBold"),
                    ),
                  ),
                  onPressed: () {
                    validate();
                  }),
            ),
          ],
        ),
      )
    );
  }
  void _toggleOld() {
    setState(() {
      _obscureTextOldPass = !_obscureTextOldPass;
    });
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }

  Future<void> validate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user = prefs.getString("userID");
    print(user);


    if ((oldPassController.text.isEmpty)) {
      showInSnackBar(snack1,2);
      return null;
    }
    if(passwordController.text.isEmpty){
      showInSnackBar(snack2,2);
      return null;
    }
    if(confirmPasswordController.text.isEmpty){
      showInSnackBar(snack3,2);
      return null;
    }
    else
      _showBottomLoader();
    // if (loginPasswordController.text.isEmpty) {
    //   showInSnackBar(snackbar2);
    //   return null;
    // } else {
    //   _showBottomLoader();
    //
    //   if (!rememberMe) {
    //     prefs.getKeys();
    //     prefs.remove("mob");
    //     prefs.remove("password");
    //     print("Okay i removed");
    //   }

    final param = {
      "farmer_id": user,
      "old_password": oldPassController.text,
      "new_password": passwordController.text,
    };

    final response = await http.post(
        Uri.parse("https://www.zappkode.com/cicr/english/webservices/farmerregistration/profileChangePassword"),
        body: param);
     Navigator.pop(context);
    var responseJson = json.decode(response.body);
    print(response.body);

    if(response.statusCode == 200) {
      showInSnackBar(passSuccess, 2);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      for (String key in preferences.getKeys()) {
        if (key != "userID" && key != "fullName" && key != "mobile" && key!="profilePic") {
          preferences.remove(key);
        }
      }
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Login_Page()),
            (Route<dynamic> route) => false,
      );
      // Navigator.pop(context);
    }else{
      showInSnackBar(server_error,2);
    }
  }


  void _showBottomLoader() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, state) {
            return SingleChildScrollView(
                padding: new EdgeInsets.only(top: 50.0, bottom: 50.0),
                child: new Container(
                  height: 50.0,
                  child: Center(
                    child: SpinKitSquareCircle(
                      color: Colors.green,
                      size: 50.0,
                    ),
                  ),
                ));
          });
        });
  }

  void showInSnackBar(String value, int sec) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "PoppinsMedium"),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: sec),
    ));
  }
}
