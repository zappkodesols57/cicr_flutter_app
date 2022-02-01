import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);

  @override
    _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String user,mobile,password,cPass,appBar,register;

  String language;
  String snackbar1,snackbar2,snackbar3;
  String snackbar4,snackbar5,snackbar6,snackbar7;

  @override
  void initState() {
    super.initState();
    autoFill();
  }

  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");

    switch (language) {
      case "Eng":
        user = "Username";
        mobile = "Mobile No.";
        password = "Password";
        cPass = "Confirm Password";
        appBar = "Registration";
        register = "Register";
        snackbar1 = "Registration successfully";
        snackbar2 = "Invalid Mobile Number or Password";
        snackbar3 = "Server Error";
        snackbar4 = "Please enter Username";
        snackbar5 = "Please enter valid Number";
        snackbar6 = "Please enter valid Password";
        snackbar7 = "Password Does not match";

        break;

      case "Mar":
        user = "वापरकर्तानाव";
        mobile = "फोन नंबर";
        password = "पासवर्ड";
        cPass = "पासवर्डची पुष्टी करा";
        appBar = "नोंदणी";
        register = "नोंदणी करा";
        snackbar1 = "नोंदणी यशस्वीरित्या";
        snackbar2 = "अवैध मोबाईल नंबर किंवा पासवर्ड";
        snackbar3 = "सर्व्हर त्रुटी";
        snackbar4 = "कृपया वापरकर्तानाव प्रविष्ट करा";
        snackbar5 = "कृपया वैध क्रमांक प्रविष्ट करा";
        snackbar6 = "कृपया वैध पासवर्ड टाका";
        snackbar7 = "पासवर्ड जुळत नाही";

        break;

      case "Hin":
        user = "उपयोगकर्ता नाम";
        mobile = "मोबाइल नंबर";
        password = "पासवर्ड";
        cPass = "पासवर्ड की पुष्टि कीजिये";
        appBar = "पंजीकरण";
        register = "रजिस्टर करें";
        snackbar1 = "पंजीकरण सफलतापूर्वक";
        snackbar2 = "अमान्य मोबाइल नंबर या पासवर्ड";
        snackbar3 = "सर्वर त्रुटि";
        snackbar4 = "कृपया उपयोगकर्ता नाम दर्ज करें";
        snackbar5 = "कृपया मान्य संख्या दर्ज करें";
        snackbar6 = "कृपया मान्य पासवर्ड दर्ज करें";
        snackbar7 = "पासवर्ड मैच नहीं कर रहा है";

        break;

      case "Gu":
        user = "ફોન નંબર";
        mobile = "મોબાઇલ નંબર";
        password = "પાસવર્ડ";
        cPass = "પાસવર્ડની પુષ્ટિ કરો";
        appBar = "નોંધણી";
        register = "નોંધણી કરો";
        snackbar1 = "નોંધણી સફળતાપૂર્વક";
        snackbar2 = "અમાન્ય મોબાઇલ નંબર અથવા પાસવર્ડ";
        snackbar3 = "સર્વર ભૂલ";
        snackbar4 = "કૃપા કરીને વપરાશકર્તા નામ દાખલ કરો";
        snackbar5 = "કૃપા કરીને માન્ય નંબર દાખલ કરો";
        snackbar6 = "કૃપા કરીને માન્ય પાસવર્ડ દાખલ કરો";
        snackbar7 = "પાસવર્ડ મેળ ખાતો નથી";

        break;

      case "Kan":
        user = "ದೂರವಾಣಿ ಸಂಖ್ಯೆ";
        mobile = "ಮೊಬೈಲ್ ನಂಬರ";
        password = "ಗುಪ್ತಪದ";
        cPass = "ಪಾಸ್ವರ್ಡ್ ದೃಢೀಕರಿಸಿ";
        appBar = "ನೋಂದಣಿ";
        register = "ನೋಂದಣಿ";
        snackbar1 = "ನೋಂದಣಿ ಯಶಸ್ವಿಯಾಗಿ";
        snackbar2 = "ಅಮಾನ್ಯ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ಅಥವಾ ಪಾಸ್‌ವರ್ಡ್";
        snackbar3 = "ಸರ್ವರ್ ದೋಷ";
        snackbar4 = "ದಯವಿಟ್ಟು ಬಳಕೆದಾರ ಹೆಸರನ್ನು ನಮೂದಿಸಿ";
        snackbar5 = "ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ";
        snackbar6 = "ದಯವಿಟ್ಟು ಮಾನ್ಯವಾದ ಪಾಸ್‌ವರ್ಡ್ ನಮೂದಿಸಿ";
        snackbar7 = "ಪಾಸ್ವರ್ಡ್ ಹೊಂದಿಕೆಯಾಗುತ್ತಿಲ್ಲ";

        break;

    }
    setState(() {});
  }







  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  final FocusNode myFocusNodeNumber = FocusNode();
  TextEditingController signupMobileController = TextEditingController();

  final FocusNode myFocusNodeUser = FocusNode();
  TextEditingController signupUserController = TextEditingController();


  final FocusNode myFocusNodePass = FocusNode();
  TextEditingController signupPassController = TextEditingController();


  final FocusNode myFocusNodeCPass = FocusNode();
  TextEditingController signupCPassController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(appBar,textAlign: TextAlign.center,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top:50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: new Image(
                        width: 160.0,
                        height: 160.0,
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/logo.png')),
                  ),
                  Container(
                    width: size.width * 0.9,
                    padding: EdgeInsets.only(
                        top: 25.0, bottom: 10.0, left: 0.0, right: 0.0),
                    child: TextField(
                      focusNode: myFocusNodeUser,
                      controller: signupUserController,
                      keyboardType: TextInputType.text,
                      maxLength: 18,
                      onChanged: (value) {
                        // if (value.length == 10) validateMob(value);
                      },
                      // inputFormatters: <TextInputFormatter>[
                      //   FilteringTextInputFormatter.
                      // ],
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
                        contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:Colors.green,
                              // _alertMob ? kPrimaryColorBlue : kPrimaryColorRed,
                              width: 0.5),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                              color:Colors.green,
                              // _alertMob ? kPrimaryColorBlue : kPrimaryColorRed,
                              width: 0.5),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.user,
                          color: Colors.green,
                          size: 20.0,
                        ),
                        // suffixIcon: Icon(
                        //   Icons.error,
                        //   color: Colors.red,
                        //   size: 20.0,
                        // ),
                        labelText: "${user} *",

                        labelStyle: TextStyle(
                            fontFamily: "PoppinsLight",
                            fontSize: 15.0,
                            color: Colors.green),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.9,
                    padding: EdgeInsets.only(
                        top: 0.0, bottom: 10.0, left: 0.0, right: 0.0),
                    child: TextField(
                      focusNode: myFocusNodeNumber,
                      controller: signupMobileController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      onChanged: (value) {
                        // if (value.length == 10) validateMob(value);
                      },
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
                        contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:Colors.green,
                              // _alertMob ? kPrimaryColorBlue : kPrimaryColorRed,
                              width: 0.5),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                              color:Colors.green,
                              // _alertMob ? kPrimaryColorBlue : kPrimaryColorRed,
                              width: 0.5),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.mobileAlt,
                          color: Colors.green,
                          size: 20.0,
                        ),
                        // suffixIcon: Icon(
                        //   Icons.error,
                        //   color: Colors.red,
                        //   size: 20.0,
                        // ),
                        labelText: "${mobile} *",

                        labelStyle: TextStyle(
                            fontFamily: "PoppinsLight",
                            fontSize: 15.0,
                            color: Colors.green),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.9,
                    padding: EdgeInsets.only(
                        top: 0.0, bottom: 10.0, left: 0.0, right: 0.0),
                    child: TextField(
                      focusNode: myFocusNodePass,
                      controller: signupPassController,
                      obscureText: _obscureTextSignup,
                      onSubmitted: (value) {
                        // validatePassword(value) ? showInSnackBar('Valid Password', 2) : showInSnackBar(warn, 8);
                        // if (value.length < 8)
                        //   showInSnackBar(
                        //       "Password must be contain at least 8 characters", 2);
                      },
                      style: TextStyle(
                          fontFamily: "PoppinsLight",
                          fontSize: 15.0,
                          color: Colors.green),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.green, width: 0.5),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.green, width: 0.5),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.lock,
                          color: Colors.green,
                          size: 20.0,
                        ),
                        labelText: "${password} *",
                        // suffixText: '*',
                        // suffixStyle: TextStyle(
                        //   color: Colors.red,
                        // ),
                        labelStyle: TextStyle(
                            fontFamily: "PoppinsLight",
                            fontSize: 15.0,
                            color: Colors.green),
                        suffixIcon: GestureDetector(
                          // onTap: _toggleSignup,
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
                    width: size.width * 0.9,
                    padding: EdgeInsets.only(
                        top: 0.0, bottom: 10.0, left: 0.0, right: 0.0),
                    child: TextField(
                      controller: signupCPassController,
                      obscureText: _obscureTextSignupConfirm,
                      style: TextStyle(
                          fontFamily: "PoppinsLight",
                          fontSize: 15.0,
                          color: Colors.green),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 13.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green,
                              width: 0.5),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green,
                              width: 0.5),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.lock,
                          color: Colors.green,
                          size: 20.0,
                        ),
                        labelText: "${cPass} *",
                        // suffixText: '*',
                        // suffixStyle: TextStyle(
                        //   color: Colors.red,
                        // ),
                        labelStyle: TextStyle(
                            fontFamily: "PoppinsLight",
                            fontSize: 15.0,
                            color: Colors.green),
                        suffixIcon: GestureDetector(
                          // onTap: _toggleSignupConfirm,
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
                            register,
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
            ),
          )),
    );
  }
  Future<void> validate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    if (signupUserController.text.isEmpty) {
      showInSnackBar(snackbar4,2);
      return null;
    }
    if ((signupMobileController.text.isEmpty ||
        signupMobileController.text.length < 10)) {
      showInSnackBar(snackbar5,2);
      return null;
    }
    if (signupPassController.text.isEmpty) {
      showInSnackBar(snackbar6,2);
      return null;
    }
    if (signupCPassController.text.isEmpty) {
      showInSnackBar(snackbar7,2);
      return null;
    }


    final param = {
      "mobile_no": signupMobileController.text,
      "fullname": signupUserController.text,
      "password": signupPassController.text,
    };

    final response = await http.post(
        Uri.parse("http://www.zappkode.com/cicr/english/webservices/farmerregistration/saveRegistrationDetails"),
        body: param);
    Navigator.pop(context);
    var responseJson = json.decode(response.body);
    print(response.body);

    if(response.statusCode == 200) {
      if(responseJson['status'] == "success") {
        prefs.setString("mobile", responseJson['mobile_no']);
        prefs.setString("username", responseJson['fullname']);
        prefs.setString("password", responseJson['decpassword']);
        showInSnackBar(snackbar1, 2);

        Future.delayed(const Duration(milliseconds: 3000),(){
          Navigator.of(context, rootNavigator: true).pop();
        });

        //
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (context) => Dashboard()),
        //       (Route<dynamic> route) => false,
        // );

      }else{
        print(responseJson['message']);
        showInSnackBar(snackbar2,2);
      }
    }else{
      showInSnackBar(snackbar3,2);
    }
  }
  void showInSnackBar(String value, int sec) {
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
      duration: Duration(seconds: sec),
    ));
  }
}
