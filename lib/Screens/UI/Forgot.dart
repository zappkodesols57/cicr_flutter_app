import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'background.dart';

class FogotPass extends StatefulWidget {
  @override
  FogotPassState createState() => FogotPassState();
}

class FogotPassState extends State<FogotPass> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController mobileController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  final FocusNode myFocusNodeMobile = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodePasswordConfirm = FocusNode();


  bool _obscureTextMobile = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;


  String id,language,password;
  String appBar,mobileno,newpass,confpass,update;
  String Invalid_Mobile_Number,server_error,passSuccess;
  String snack1,snack2,snack3,snack4,snack5,snack6;


  @override
  void initState() {
    autoFill();
    super.initState();
  }

  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");
    password = prefs.getString("password");

    switch (language) {
      case "Eng":
        appBar = "Forgot Password";
        mobileno = "Mobile Number *";
        newpass = "New Password *";
        confpass = "Confirm New Password *";
        update = "Update";

        Invalid_Mobile_Number = "Invalid Mobile Number or Password";
        server_error = "Server Error";
        passSuccess = "Password changed successfully";

        snack1 = "Please enter Mobile Number";
        snack2 = "Please enter New Password";
        snack3 = "Please enter Confirm Password";
        snack4 = "Password must contain at least 8 characters";
        snack5 = "Password not match";
        snack6 = "Entered password is same as old password";

        break;

      case "Mar":
        appBar = "पासवर्ड विसरलात";
        mobileno = "मोबाईल नंबर *";
        newpass = "नवीन पासवर्ड *";
        confpass = "नवीन परवलीच्या शब्दाची खात्री करा *";
        update = "अपडेट करा";

        Invalid_Mobile_Number = "अवैध मोबाईल नंबर किंवा पासवर्ड";
        server_error = "सर्व्हर त्रुटी";
        passSuccess = "पासवर्ड यशस्वीरित्या बदलला";

        snack1 = "कृपया मोबाईल नंबर टाका";
        snack2 = "कृपया नवीन पासवर्ड टाका";
        snack3 = "कृपया पासवर्ड कन्फर्म करा";
        snack4 = "पासवर्डमध्ये किमान 8 वर्ण असणे आवश्यक आहे";
        snack5 = "पासवर्ड जुळत नाही";
        snack6 = "एंटर केलेला पासवर्ड जुन्या पासवर्डसारखाच आहे";

        break;

      case "Hin":
        appBar = "पासवर्ड भूल गए";
        mobileno = "मोबाइल नंबर *";
        newpass = "नया पासवर्ड *";
        confpass = "नए पासवर्ड की पुष्टि करें *";
        update = "अद्यतन";

        Invalid_Mobile_Number = "अमान्य मोबाइल नंबर या पासवर्ड";
        server_error = "सर्वर त्रुटि";
        passSuccess = "पासवर्ड सफलतापूर्वक बदला गया";

        snack1 = "कृपया मोबाइल नंबर दर्ज करें";
        snack2 = "कृपया नया पासवर्ड दर्ज करें";
        snack3 = "कृपया पासवर्ड की पुष्टि करें दर्ज करें";
        snack4 = "पासवर्ड में कम से कम 8 अक्षर होने चाहिए";
        snack5 = "पासवर्ड मेल नहीं खाता";
        snack6 = "दर्ज पासवर्ड पुराने पासवर्ड के समान है";

        break;

      case "Gu":
        appBar = "પાસવર્ડ ભૂલી ગયા છો";
        mobileno = "મોબાઇલ નંબર *";
        newpass = "નવો પાસવર્ડ *";
        confpass = "નવાપાસવર્ડની પુષ્ટી કરો *";
        update = "અપડેટ કરો";

        Invalid_Mobile_Number = "અમાન્ય મોબાઇલ નંબર અથવા પાસવર્ડ";
        server_error = "સર્વર ભૂલ";
        passSuccess = "પાસવર્ડ સફળતાપૂર્વક બદલાયો";

        snack1 = "કૃપા કરીને મોબાઈલ નંબર દાખલ કરો";
        snack2 = "કૃપા કરીને નવો પાસવર્ડ દાખલ કરો";
        snack3 = "કૃપા કરીને કન્ફર્મ પાસવર્ડ દાખલ કરો";
        snack4 = "પાસવર્ડમાં ઓછામાં ઓછા 8 અક્ષરો હોવા જોઈએ";
        snack5 = "પાસવર્ડ મેળ ખાતો નથી";
        snack6 = "દાખલ કરેલ પાસવર્ડ જૂના પાસવર્ડ જેવો જ છે";

        break;

      case "Kan":
        appBar = "ಪಾಸ್ವರ್ಡ್ ಮರೆತಿರಾ";
        mobileno = "ಮೊಬೈಲ್ ನಂಬರ *";
        newpass = "ಹೊಸ ಪಾಸ್ವರ್ಡ್ *";
        confpass = "ಹೊಸ ಗುಪ್ತಪದವನ್ನು ಖಚಿತಪಡಿಸಿ *";
        update = "ನವೀಕರಿಸಿ";

        Invalid_Mobile_Number = "ಅಮಾನ್ಯ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ಅಥವಾ ಪಾಸ್‌ವರ್ಡ್";
        server_error = "ಸರ್ವರ್ ದೋಷ";
        passSuccess = "ಪಾಸ್ವರ್ಡ್ ಯಶಸ್ವಿಯಾಗಿ ಬದಲಾಗಿದೆ";

        snack1 = "ದಯವಿಟ್ಟು ಮೊಬೈಲ್ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ";
        snack2 = "ದಯವಿಟ್ಟು ಹೊಸ ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಿ";
        snack3 = "ದಯವಿಟ್ಟು ಪಾಸ್‌ವರ್ಡ್ ಅನ್ನು ದೃಢೀಕರಿಸಿ ನಮೂದಿಸಿ";
        snack4 = "ಪಾಸ್ವರ್ಡ್ ಕನಿಷ್ಠ 8 ಅಕ್ಷರಗಳನ್ನು ಹೊಂದಿರಬೇಕು";
        snack5 = "ಪಾಸ್ವರ್ಡ್ ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ";
        snack6 = "ನಮೂದಿಸಿದ ಪಾಸ್‌ವರ್ಡ್ ಹಳೆಯ ಪಾಸ್‌ವರ್ಡ್‌ನಂತೆಯೇ ಇರುತ್ತದೆ";


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
          title: Text(appBar),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {Navigator.pop(context);},
          ),
        ),
        body: Background(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Container(
              //   width: size.width * 0.99,
              //   padding: EdgeInsets.only(
              //       top: 0.0, bottom: 10.0, left: 15.0, right: 15.0),
              //   child: Text(
              //     "For best security practices, you should change your password periodically",
              //     style: TextStyle(
              //         color: kPrimaryColorBlue,
              //         fontSize: 14.0,
              //         // fontFamily: "CoconRegular"
              //       ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
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
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      focusNode: myFocusNodeMobile,
                      controller: mobileController,

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
                          FontAwesomeIcons.mobile,
                          size: 20.0,
                          color: Colors.green,
                        ),
                        hintText: mobileno,
                        hintStyle: TextStyle(
                            fontFamily: "PoppinsLight", fontSize: 13.0, color: Colors.green),
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
                      inputFormatters: <TextInputFormatter>[
                        // FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(15)
                      ],
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
                      inputFormatters: <TextInputFormatter>[
                        // FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(15)
                      ],

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
        ))
    );
  }

  void _toggleOld() {
    setState(() {
      _obscureTextMobile = !_obscureTextMobile;
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

  // bool validatePassword(String value){
  //   String  pattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
  //   RegExp regExp = new RegExp(pattern);
  //   return regExp.hasMatch(value);
  // }

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

  Future<void> validate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // if ((loginNumberController.text.isEmpty ||
    //     loginNumberController.text.length < 10)) {
    //   showInSnackBar(snackbar1);
    //   return null;
    // }
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
        "mobile_no": mobileController.text,
      };

      final response = await http.post(
          Uri.parse("https://www.zappkode.com/cicr/english/webservices/farmerregistration/forgotPassword"),
          body: param);
      // Navigator.pop(context);
      var responseJson = json.decode(response.body);
      print(response.body);

      if(response.statusCode == 200) {
        if(responseJson['status'] == "Success") {
          setState(() {
            id = responseJson['id'];
          });
          validateData(responseJson['id']);

        }else{
          print(responseJson['message']);
          showInSnackBar(Invalid_Mobile_Number,2);
        }
      }else{
        showInSnackBar(server_error,2);
      }
    }

  Future<void> validateData(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (mobileController.text.isEmpty) {
      showInSnackBar(snack1, 2);

      return null;
    }

    if (passwordController.text.isEmpty) {
      showInSnackBar(snack2, 2);
      return null;
    }
    if (confirmPasswordController.text.isEmpty) {
      showInSnackBar(snack3, 2);
      return null;
    }
    if (passwordController.text.length < 8) {
      showInSnackBar(snack4, 2);
      return null;
    }
    if (passwordController.text == password|| confirmPasswordController.text == password) {
      showInSnackBar(snack6, 2);
      return null;
    }
    if (passwordController.text != confirmPasswordController.text) {
      showInSnackBar(snack5, 2);
      return null;
    }else {
      _showBottomLoader();

      final param = {
        "id": id,
        "password": confirmPasswordController.text,
      };

      final response = await http.post(
          Uri.parse(
              "https://www.zappkode.com/cicr/english/webservices/farmerregistration/changePassword"),
          body: param);

      Navigator.pop(context);
      var responseJson = json.decode(response.body);
      print(responseJson);

      if (response.statusCode == 200) {
        if (responseJson['status'] == "Success") {
          mobileController.clear();
          passwordController.clear();
          confirmPasswordController.clear();
          showInSnackBar(passSuccess, 2);
          Future.delayed(const Duration(seconds: 2),(){
            Navigator.of(context, rootNavigator: true).pop();
          });
          // showInSnackBar(password.message, 2);
        } else {
          // print(password.status);
          showInSnackBar(responseJson['message'], 2);
          return null;
        }
      }
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
}