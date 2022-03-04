import 'dart:convert';
import 'dart:io';
import 'package:cicr_flutter_app/Screens/HomeScreen/HomeScreen.dart';
import 'package:cicr_flutter_app/Screens/UI/Registration.dart';
import 'package:cicr_flutter_app/Screens/UI/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'Forgot.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key key}) : super(key: key);

  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String phone,password,remember,forgot,login,guest,register,newUser;
  String Invalid_Mobile_Number,server_error;
  String snackbar1,snackbar2;

  String language;

  @override
  void initState() {
    super.initState();
    autoFill();
  }

  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginNumberController.text = prefs.getString("mob");
    loginPasswordController.text = prefs.getString("password");
    language = prefs.getString("language");

    switch (language) {
      case "Eng":
       phone = "Phone Number";
       password = "Password";
       remember = "Remember Me";
       forgot = "Forgot Password?";
       login = "LOGIN";
       guest = "Guest Login";
       register = "Register Now";
       newUser = "New User?";
       Invalid_Mobile_Number = "Invalid Mobile Number or Password";
       server_error = "Server Error";
       snackbar1 = "Please enter valid Number";
       snackbar2 = "Please enter valid Password";
        break;

      case "Mar":
        phone = "फोन नंबर";
        password = "पासवर्ड";
        remember = "लक्षात ठेवा";
        forgot = "पासवर्ड विसरलात?";
        login = "लॉगिन करा";
        guest = "अतिथी लॉगिन";
        register = "आता नोंदणी करा";
        newUser = "नवीन वापरकर्ता?";
        Invalid_Mobile_Number = "अवैध मोबाईल नंबर किंवा पासवर्ड";
        server_error = "सर्व्हर त्रुटी";
        snackbar1 = "कृपया वैध क्रमांक प्रविष्ट करा";
        snackbar2 = "कृपया वैध पासवर्ड टाका";
        break;

      case "Hin":
        phone = "फ़ोन नंबर";
        password = "पासवर्ड";
        remember = "याद रखे";
        forgot = "पासवर्ड भूल गए?";
        login = "लॉग इन करें";
        guest = "मेहमान लॉगइन करें";
        register = "अभी पंजीकरण करें";
        newUser = "नए उपयोगकर्ता?";
        Invalid_Mobile_Number = "अमान्य मोबाइल नंबर या पासवर्ड";
        server_error = "सर्वर त्रुटि";
        snackbar1 = "कृपया मान्य संख्या दर्ज करें";
        snackbar2 = "कृपया मान्य पासवर्ड दर्ज करें";
        break;

      case "Gu":
        phone = "ફોન નંબર";
        password = "પાસવર્ડ";
        remember = "યાદ રાખો";
        forgot = "પાસવર્ડ ભૂલી ગયા છો?";
        login = "પ્રવેશ કરો";
        guest = "મહેમાન લૉગિન";
        register = "અત્યારે નોંધાવો";
        newUser = "નવા વપરાશકર્તા?";
        Invalid_Mobile_Number = "અમાન્ય મોબાઇલ નંબર અથવા પાસવર્ડ";
        server_error = "સર્વર ભૂલ";
        snackbar1 = "કૃપા કરીને માન્ય નંબર દાખલ કરો";
        snackbar2 = "કૃપા કરીને માન્ય પાસવર્ડ દાખલ કરો";
        break;

      case "Kan":
        phone = "ದೂರವಾಣಿ ಸಂಖ್ಯೆ";
        password = "ಗುಪ್ತಪದ";
        remember = "ನೆನಪಿರಲಿ";
        forgot = "ಪಾಸ್ವರ್ಡ್ ಮರೆತಿರಾ?";
        login = "ಲಾಗಿನ್";
        guest = "ಅತಿಥಿ ಲಾಗಿನ್";
        register = "ಈಗ ನೋಂದಣಿ ಮಾಡಿ";
        newUser = "ಹೊಸ ಬಳಕೆದಾರ?";
        Invalid_Mobile_Number = "ಅಮಾನ್ಯ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ಅಥವಾ ಪಾಸ್‌ವರ್ಡ್";
        server_error = "ಸರ್ವರ್ ದೋಷ";
        snackbar1 = "ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ";
        snackbar2 = "ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಿ";
        break;

    }
    setState(() {});
  }

  @override
  void dispose() {
    myFocusNodeNumberLogin.dispose();
    myFocusNodePasswordLogin.dispose();
    loginNumberController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  final FocusNode myFocusNodeNumberLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  TextEditingController loginNumberController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;
  bool rememberMe = false;

  void _onRememberMeChanged(bool newValue) async {
    setState(() {
      rememberMe = newValue;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (newValue) {
      prefs.setString("mob", loginNumberController.text);
      prefs.setString("password", loginPasswordController.text);
      print("Okay i remember");
    } else {
      prefs.getKeys();
      prefs.remove("mob");
      prefs.remove("password");
      print("Okay i removed");
    }
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async => exit(0),
      child: Scaffold(
        key: _scaffoldKey,
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: new Image(
                      width: 180.0,
                      height: 180.0,
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/logo.png')),
                ),
                SizedBox(height: 20.0,),
                Column(
                  children: [
                    Container(
                      width: size.width * 0.99,
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 25.0, right: 25.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: TextField(
                        focusNode: myFocusNodeNumberLogin,
                        controller: loginNumberController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(
                            fontFamily: "PoppinsLight",
                            fontSize: 15.0,
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
                            borderSide: BorderSide(
                                color: Colors.green, width: 0.5),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.green, width: 0.5),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                          ),
                          prefixIcon: Icon(
                            FontAwesomeIcons.mobileAlt,
                            color: Colors.green,
                            size: 20.0,
                          ),
                          labelText: phone??"",
                          labelStyle: TextStyle(
                              fontFamily: "PoppinsLight",
                              fontSize: 13.0,
                              color: Colors.green),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.99,
                      padding: EdgeInsets.only(
                          top: 0.0, bottom: 0.0, left: 25.0, right: 25.0),
                      child: TextField(
                        focusNode: myFocusNodePasswordLogin,
                        controller: loginPasswordController,
                        obscureText: _obscureTextLogin,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        style: TextStyle(
                            fontFamily: "PoppinsLight",
                            fontSize: 15.0,
                            color: Colors.green),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: new OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.green, width: 0.5),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 13.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 0.5,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                          ),
                          prefixIcon: Icon(
                            FontAwesomeIcons.lock,
                            size: 20.0,
                            color: Colors.green,
                          ),
                          labelText: password??"",
                          labelStyle: TextStyle(
                              fontFamily: "PoppinsLight",
                              fontSize: 13.0,
                              color: Colors.green),
                          suffixIcon: GestureDetector(
                            onTap: _toggleLogin,
                            child: Icon(
                              _obscureTextLogin
                                  ? FontAwesomeIcons.eyeSlash
                                  : FontAwesomeIcons.eye,
                              size: 20.0,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: rememberMe??"",
                          activeColor: Colors.green,
                          onChanged: _onRememberMeChanged,
                        ),
                        Text(
                          remember??"",
                          style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold,fontFamily: "PoppinsMedium"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return FogotPass();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                forgot??"",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: "PoppinsMedium",
                                  fontSize: 15.0,
                                ),
                              )),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
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
                              login??"",
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
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: FlatButton(
                          onPressed: () {
                            validateGuest();
                          },
                          child: Text(
                            guest??"",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                                color: Colors.green,
                                fontSize: 16.0,
                                fontFamily:"PoppinsBold"),
                          ),
                      ),
                    ),

                    // SizedBox(height: 10.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            newUser??"",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14.0,
                                fontFamily: "PoppinsMedium"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0.0),
                          child: FlatButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return Customer_Signup();
                                //     },
                                //   ),
                                // );
                                Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation, anotherAnimation) {
                                      return Registration();
                                    }));
                              },
                              child: Text(
                                register??"",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16.0,
                                    fontFamily:"PoppinsBold"),
                              ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  Future<void> validate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if ((loginNumberController.text.isEmpty ||
        loginNumberController.text.length < 10)) {
      showInSnackBar(snackbar1);
      return null;
    }
    if (loginPasswordController.text.isEmpty) {
      showInSnackBar(snackbar2);
      return null;
    } else {
      _showBottomLoader();

      if (!rememberMe) {
        prefs.getKeys();
        prefs.remove("mob");
        prefs.remove("password");
        print("Okay i removed");
      }

      final param = {
        "mobile_no": loginNumberController.text,
        "password": loginPasswordController.text,
      };

      final response = await http.post(
        Uri.parse("https://www.zappkode.com/cicr/english/webservices/farmerregistration/farmerLogin"),
        body: param);
      Navigator.pop(context);
      var responseJson = json.decode(response.body);
      print(response.body);

      if(response.statusCode == 200) {
        if(responseJson['status'] == "success") {
          prefs.setString("userID", responseJson['id']);
          prefs.setString("fullName", responseJson['fullname']);
          prefs.setString("mobile", responseJson['mobile_no']);
          prefs.setString("profilePic", responseJson['profile_pic']);
          prefs.setString("isLogin", "1");
          // String password = loginPasswordController.text.toString();
          // prefs.setString("password", password);


          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
                (Route<dynamic> route) => false,
          );

        }else{
          print(responseJson['message']);
          showInSnackBar(Invalid_Mobile_Number);
        }
      }else{
        showInSnackBar(server_error);
      }
    }
  }

  Future<void> validateGuest() async {
    _showBottomLoader();
    SharedPreferences prefs = await SharedPreferences.getInstance();

      final param = {
        "mobile_no": "9764195482",
        "password": "anjali",
      };

      final response = await http.post(
        Uri.parse("https://www.zappkode.com/cicr/english/webservices/farmerregistration/farmerLogin"),
        body: param,);
      Navigator.pop(context);
      // LoginData data;
      var responseJson = json.decode(response.body);
      print(response.body);
      // showInSnackBar(responseJson['status']);

      if(response.statusCode == 200) {
        if(responseJson['status'] == "success") {
          prefs.setString("userID", responseJson['id']);
          prefs.setString("fullName", responseJson['fullname']);
          prefs.setString("mobile", responseJson['mobile_no']);
          prefs.setString("profilePic", responseJson['profile_pic']);
          prefs.setString("isLogin", "1");
          // showInSnackBar("Login Successfully");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
                (Route<dynamic> route) => false,
          );
        }else{
          print(responseJson['message']);
          showInSnackBar(Invalid_Mobile_Number);
        }
      }else{
        showInSnackBar(server_error);
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
