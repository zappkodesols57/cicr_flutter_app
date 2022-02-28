import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'ChangePass.dart';

class Profile extends StatefulWidget {
  String title,name, number, img;

  Profile(this.title,this.name, this.number, this.img);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isButtonDisabled = true;
  bool _isButtonDisabledColor = true;
  String dropdownValue = 'Select Gender';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final ScrollController _controller = ScrollController();

  String ProfileImg,language,phone,name,change;
  int id;

  @override
  void initState() {
    _isButtonDisabled = true;
    _isButtonDisabledColor = true;
    getCredentials();
    super.initState();
    // setDetails();
  }

  //
  // Future<void> setDetails() async {
  //   SchedulerBinding.instance
  //       .addPostFrameCallback((_) => _showLoaderDialog(context));
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   number = prefs.getString("mobile");
  //   id = prefs.getInt("userID");
  //   token = prefs.getString("token");
  //   print('$number $id  $token');
  //
  //   final param = {
  //     "mobile_no": number,
  //   };
  //
  //   final response = await http.post(
  //     Uri.parse("http://157.230.228.250/get-customer-details-api/"),
  //     body: param,
  //     headers: {HttpHeaders.authorizationHeader: "Token $token"},
  //   );
  //
  //   print(response.statusCode);
  //   GetPersonalInfo info;
  //   var responseJson = json.decode(response.body);
  //   print(response.body);
  //   info = new GetPersonalInfo.fromJson(jsonDecode(response.body));
  //   print(responseJson);
  //
  //   if (response.statusCode == 200) {
  //     if (info.status == "success") {
  //       print("Profile fetch Successful");
  //       print(info.profileData.email);
  //       fnameController.text = info.profileData.firstName.isEmpty? "" :info.profileData.firstName;
  //       lnameController.text = info.profileData.lastName.isEmpty ? "" :info.profileData.lastName;
  //       // nameController.text = '${fnameController.text} ${lnameController.text}';
  //       emailController.text = info.profileData.email.isEmpty ? "" : info.profileData.email;
  //       dobController.text = info.profileData.cDob == null ? "" : DateFormat('dd-MM-yyyy').format(DateTime.parse(info.profileData.cDob));
  //       mobController.text = info.profileData.mobileNo.isEmpty ? "" : info.profileData.mobileNo;
  //       genController.text = (info.profileData.cGender == null) ? "" : info.profileData.cGender.capitalize();
  //       areaController.text = info.profileData.cArea.isEmpty ? "" : info.profileData.cArea;
  //       pinController.text = info.profileData.cPincode.isEmpty ? "" : info.profileData.cPincode;
  //       cityController.text = info.profileData.cCity.isEmpty ? "" : info.profileData.cCity;
  //       stateController.text = info.profileData.cState.isEmpty ? "" : info.profileData.cState;
  //       add1Controller.text = info.profileData.cAddress1.isEmpty ? "" : info.profileData.cAddress1;
  //       add2Controller.text = info.profileData.cAddress2.isEmpty ? "" : info.profileData.cAddress2;
  //       profileUid.text = info.profileData.cUniqueId.isEmpty ? "" : info.profileData.cUniqueId;
  //
  //       if(info.profileData.cGender == null){
  //         dropdownValue="Select Gender";
  //       }else{
  //         setState(() {
  //           dropdownValue=info.profileData.cGender.capitalize();
  //         });
  //       }
  //
  //
  //
  //
  //       // setData(id, token);
  //       Navigator.of(context, rootNavigator: true).pop();
  //     } else
  //       print(info.status);
  //   } else
  //     print(info.status);
  // }

  TextEditingController profile = new TextEditingController();
  TextEditingController profileUid = new TextEditingController();

  // Future<void> setData(int id, String token) async {
  //   final param = {
  //     "user_id": id.toString(),
  //   };
  //
  //   final response = await http.post(
  //     Uri.parse("http://157.230.228.250/get-customer-profile-image-api/"),
  //     body: param,
  //     headers: {HttpHeaders.authorizationHeader: "Token $token"},
  //   );
  //
  //   GetProfileImage profileImage;
  //   var responseJson = json.decode(response.body);
  //   print(response.body);
  //   profileImage = new GetProfileImage.fromJson(jsonDecode(response.body));
  //   print(responseJson);
  //
  //   if (response.statusCode == 200) {
  //     if (profileImage.status == "success") {
  //       print("Profile fetch Successful");
  //       print(profileImage.data.firstName);
  //       profile.text = profileImage.data.profileImage;
  //
  //       setState(() {});
  //     } else
  //       print(profileImage.status);
  //   } else
  //     print(profileImage.status);
  // }
  Future<void> getCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    fnameController.text = prefs.getString("fullName");
    mobController.text = prefs.getString("mobile");
    language = prefs.getString("language");

    switch (language){
      case "Eng" :
        phone = "Phone Number";
        name = "Name";
        change = "Change Password";
        break;

      case "Mar":
        phone = "फोन नंबर";
        name = "नाव";
        change = "पासवर्ड बदला";
        break;

      case "Hin":
        phone = "फ़ोन नंबर";
        name = "नाम";
        change = "पासवर्ड बदलें";
        break;

      case "Gu":
        phone = "ફોન નંબર";
        name = "નામ";
        change = "પાસવર્ડ બદલો";
        break;

      case "Kan":
        phone = "ದೂರವಾಣಿ ಸಂಖ್ಯೆ";
        name = "ಹೆಸರು";
        change = "ಗುಪ್ತಪದವನ್ನು ಬದಲಿಸಿ";
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    fnameController.dispose();
    lnameController.dispose();
    // nameController.dispose();
    mobController.dispose();
    myFocusNodeFname.dispose();
    myFocusNodeLname.dispose();
    myFocusNodeMob.dispose();
  }

  TextEditingController fnameController = new TextEditingController();
  TextEditingController lnameController = new TextEditingController();
  TextEditingController mobController = new TextEditingController();
  final FocusNode myFocusNodeFname = FocusNode();
  final FocusNode myFocusNodeLname = FocusNode();
  final FocusNode myFocusNodeMob = FocusNode();

  // Future<void> _selectDate(BuildContext context) async {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1950, 1),
  //     lastDate: DateTime.now(),
  //   ).then((pickedDate) {
  //     dobController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
  //     print("_____ASASA______DOB ${dobController.text}");
  //   });
  // }

  updateProfile() {
    //setDetails();
    showInSnackBar("Profile updated successfully");
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // double headerHeight = size.height * 0.17;
    double headerHeight = 160.0;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          // actions: <Widget>[
          //   FlatButton(
          //     textColor: _isButtonDisabledColor ? Colors.grey : Colors.white,
          //     onPressed: () {
          //       // _isButtonDisabled ? null : save();
          //     },
          //     child: Text("SAVE"),
          //     shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          new Container(
            height: headerHeight,
            decoration: new BoxDecoration(
              color: Colors.transparent,
              borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                    spreadRadius: 0.0,
                    blurRadius: 0.0,
                    offset: new Offset(0.0, 0.0),
                    color: Colors.black26),
              ],
            ),
            child: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                // linear gradient
                new Container(
                  height: headerHeight,
                  decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                    gradient: new LinearGradient(colors: <Color>[
                      //7928D1
                      Colors.green, Colors.green
                    ], stops: <double>[
                      0.5,
                      0.5
                    ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                  ),
                ),
                // radial gradient
                new CustomPaint(
                  painter: new HeaderGradientPainter(),
                ),
                new Padding(
                  padding: new EdgeInsets.only(
                      top: 0.0, left: 15.0, right: 15.0, bottom: 0.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _buildAvatar(size),
                              SizedBox(
                                height: 10.0,
                              ),
                              // Text(
                              //   'Your GreenBill Pin for Checkout',
                              //   style: TextStyle(color: Colors.white),
                              // ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width * 0.75,
            padding:
                EdgeInsets.only(top: 20.0, bottom: 10.0, left: 0.0, right: 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: new TextField(
              focusNode: new AlwaysDisabledFocusNode(),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                LengthLimitingTextInputFormatter(15)
              ],
              controller: fnameController,
              onChanged: (value) {},
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "PoppinsLight",
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.user,
                  color: Colors.green,
                ),
                labelText: name,
                labelStyle: TextStyle(
                    fontFamily: "PoppinsLight",
                    fontSize: 13.0,
                    color: Colors.green),
                border: InputBorder.none,
                counterStyle: TextStyle(
                  height: double.minPositive,
                ),
                counterText: "",
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 13.0, horizontal: 5),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                ),
                focusedBorder: new OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                ),
              ),
            ),
          ),
          // Container(
          //   width: size.width * 0.95,
          //   padding: EdgeInsets.only(top: 0.0, bottom: 10.0, left: 0.0, right: 0.0),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   child: new TextField(
          //     inputFormatters: [
          //       FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          //       LengthLimitingTextInputFormatter(15)],
          //
          //     controller: lnameController,
          //     onChanged: (value) {
          //       setState(() {
          //         _isButtonDisabledColor = false;
          //         _isButtonDisabled = false;
          //       });
          //     },
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 15,
          //       fontFamily: "PoppinsLight",
          //       fontStyle: FontStyle.normal,
          //       fontWeight: FontWeight.w400,
          //     ),
          //     decoration: InputDecoration(
          //       prefixIcon: Icon(
          //         FontAwesomeIcons.user,
          //         color: Colors.green,
          //       ),
          //       labelText: "Last Name *",
          //       labelStyle: TextStyle(
          //           fontFamily: "PoppinsLight",
          //           fontSize: 13.0,
          //           color: Colors.green),
          //       border: InputBorder.none,
          //       counterStyle: TextStyle(
          //         height: double.minPositive,
          //       ),
          //       counterText: "",
          //       contentPadding:
          //       const EdgeInsets.symmetric(vertical: 13.0, horizontal: 5),
          //       enabledBorder: OutlineInputBorder(
          //         borderSide: BorderSide(
          //             color: Colors.green,
          //             width: 0.5),
          //         borderRadius: const BorderRadius.all(Radius.circular(35.0)),
          //       ),
          //       focusedBorder: new OutlineInputBorder(
          //         borderSide: BorderSide(
          //             color: Colors.green,
          //             width: 0.5),
          //         borderRadius: const BorderRadius.all(Radius.circular(35.0)),
          //       ),
          //     ),
          //   ),
          // ),
          if (widget.name != "guest")
            Container(
              width: size.width * 0.75,
              padding: EdgeInsets.only(
                  top: 0.0, bottom: 10.0, left: 0.0, right: 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: new TextField(
                focusNode: new AlwaysDisabledFocusNode(),
                enableInteractiveSelection: false,
                // will disable paste operation
                controller: mobController,
                onChanged: (value) {
                  setState(() {});
                },
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontStyle: FontStyle.normal,
                  fontFamily: "PoppinsLight",
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                  labelText: phone,
                  labelStyle: TextStyle(
                      fontFamily: "PoppinsLight",
                      fontSize: 13.0,
                      color: Colors.green),
                  border: InputBorder.none,
                  counterStyle: TextStyle(
                    height: double.minPositive,
                  ),
                  counterText: "",
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 13.0, horizontal: 5),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 0.5),
                    borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                  ),
                ),
              ),
            ),
          if (widget.name != "guest")
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangePass()));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0,right: 40.0,top: 15,bottom: 15),
                child: Text(
                  change,
                  style: TextStyle(fontFamily: "PoppinsMedium", color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ])));
  }

  Widget _buildAvatar(Size size) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Center(
          child: Stack(
            children: <Widget>[
              if (widget.img != "")
                ClipOval(
                  child: new Image.network(
                    widget.img,
                    // height: size.height * 0.1,
                    height: 140.0,
                    width: 140.0,
                    fit: BoxFit.cover,
                    // loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                    //   if (loadingProgress == null) return child;
                    //   return Center(
                    //     child: CircularProgressIndicator(
                    //       value: loadingProgress.expectedTotalBytes != null ?
                    //       loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                    //           : null,
                    //     ),
                    //   );
                    // },
                  ),
                ),
              if (widget.img == "")
                Center(
                  child: ClipOval(
                    child: CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: Image.network("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                      radius: 70,
                    ),
                    // new Image.network(widget.img,
                    //   // height: size.height * 0.1,
                    //   height: 140.0,
                    //   width: 140.0,
                    //   fit: BoxFit.fill,
                    //   // loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                    //   //   if (loadingProgress == null) return child;
                    //   //   return Center(
                    //   //     child: CircularProgressIndicator(
                    //   //       value: loadingProgress.expectedTotalBytes != null ?
                    //   //       loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                    //   //           : null,
                    //   //     ),
                    //   //   );
                    //   // },
                    // ),
                  ),
                ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: InkWell(
                  onTap: () {
                    _showSelectionDialog(context);
                  },
                  child: CircleAvatar(
                    radius: size.width * 0.035,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      FontAwesomeIcons.camera,
                      color: Colors.white,
                      size: 13.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Choose Image Source"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        _openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        _openCamera(context);
                      },
                    ),
                  ],
                ),
              ));
        });
  }

  void _openCamera(BuildContext context) async {
    Navigator.of(context).pop();
    final ImagePicker _picker = ImagePicker();
    final XFile picture =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 25);
    if (picture != null) {
      sendData(File(picture.path));
    }
  }

  void _openGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    final XFile picture =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    Navigator.of(context).pop();
    if (picture != null) {
      sendData(File(picture.path));
    }
  }

  _showLoaderDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SingleChildScrollView(
                  padding: new EdgeInsets.only(top: 0.0, bottom: 0.0),
                  child: new Container(
                    height: 40.0,
                    child: Center(
                      child: SpinKitWave(
                        color: Colors.green,
                        size: 40.0,
                      ),
                    ),
                  )));
        });
  }

  bool validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  //
  // Future<void> save() async {
  //   if (fnameController.text.isEmpty) {
  //     showInSnackBar("Please enter First Name");
  //     return null;
  //   }
  //   if (lnameController.text.isEmpty) {
  //     showInSnackBar("Please enter Last Name");
  //     return null;
  //   }
  //   // if(mobController.text.isEmpty) {
  //   //   showInSnackBar("Please enter Mobile Number", 2);
  //   //   return null;
  //   // }
  //   if (emailController.text.isEmpty) {
  //     showInSnackBar("Please enter Email");
  //     return null;
  //   }
  //   if (emailController.text.isNotEmpty) {
  //     if (emailController.text.contains('com') ||
  //         emailController.text.contains('net') ||
  //         emailController.text.contains('edu') ||
  //         emailController.text.contains('org') ||
  //         emailController.text.contains('mil') ||
  //         emailController.text.contains('gov')) {
  //       if (validateEmail(emailController.text) == false) {
  //         showInSnackBar("Invalid Email");
  //         return null;
  //       }
  //     } else {
  //       showInSnackBar("Invalid Email");
  //       return null;
  //     }
  //   }
  //   // if(dobController.text.isEmpty) {
  //   //   showInSnackBar("Please enter Date of Birth", 2);
  //   //   return null;
  //   // }
  //   if (genController.text.isEmpty) {
  //     showInSnackBar("Please select Gender");
  //     return null;
  //   }
  //   if (genController.text == "Select Gender") {
  //     showInSnackBar("Please select Gender");
  //     return null;
  //   }
  //   if (stateController.text == "" || stateController.text.isEmpty) {
  //     showInSnackBar("Please select State");
  //     return null;
  //   }
  //   if (cityController.text == "" || cityController.text.isEmpty) {
  //     showInSnackBar("Please select City");
  //     return null;
  //   }
  //   if (areaController.text == "" || areaController.text.isEmpty) {
  //     showInSnackBar("Please enter Area");
  //     return null;
  //   }
  //   // if(areaController.text.isEmpty) {
  //   //   showInSnackBar("Please enter Aadhar Number", 2);
  //   //   return null;
  //   // }
  //   // if(areaController.text.length < 12) {
  //   //   showInSnackBar("Please enter valid Aadhar Number", 2);
  //   //   return null;
  //   // }
  //   if (pinController.text.isEmpty || pinController.text == "") {
  //     showInSnackBar("Please enter Pin Code");
  //     return null;
  //   }
  //   if(pinController.text.isNotEmpty) {
  //     if (pinController.text.length < 6) {
  //       showInSnackBar("Please enter valid Pin Code");
  //       return null;
  //     }
  //   }
  //   // if(pinController.text.length > 10) {
  //   //   showInSnackBar("Please enter valid Pan Number", 2);
  //   //   return null;
  //   // }
  //
  //   SchedulerBinding.instance
  //       .addPostFrameCallback((_) => _showLoaderDialog(context));
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   prefs.setString("fName", fnameController.text);
  //   prefs.setString("lName", lnameController.text);
  //
  //   String token = prefs.getString("token");
  //   int id = prefs.getInt("userID");
  //   print('$id $token');
  //
  //   final param = {
  //     "user_id": id.toString(),
  //     "email": emailController.text,
  //     "first_name": fnameController.text.capitalize(),
  //     "last_name": lnameController.text.capitalize(),
  //     "c_dob": dobController.text == null ? "" :dobController.text,
  //     "c_gender": genController.text,
  //     "c_address_1": add1Controller.text,
  //     "c_address_2": add2Controller.text,
  //     "c_area": areaController.text.capitalize(),
  //     "c_city": cityController.text,
  //     "c_state": stateController.text,
  //     "c_pincode": pinController.text,
  //   };
  //   print("parameters $param");
  //
  //   final response = await http.post(
  //     Uri.parse("http://157.230.228.250/set-customer-profile-api/"),
  //     body: param,
  //     headers: {HttpHeaders.authorizationHeader: "Token $token"},
  //   );
  //
  //   print(response.statusCode);
  //   CommonData data;
  //   var responseJson = json.decode(response.body);
  //   print(response.body);
  //   data = new CommonData.fromJson(jsonDecode(response.body));
  //   print(responseJson);
  //
  //   if (response.statusCode == 200) {
  //     if (data.status == "success") {
  //       print("Profile update Successful");
  //       print(data.message);
  //       Navigator.of(context, rootNavigator: true).pop();
  //       Navigator.pop(context, true);
  //     } else {
  //       Navigator.of(context, rootNavigator: true).pop();
  //       print(data.status);
  //       showInSnackBar(data.message);
  //     }
  //   } else {
  //     Navigator.of(context, rootNavigator: true).pop();
  //     print(data.status);
  //     showInSnackBar(data.message);
  //   }
  // }

  // Future<void> removeProfile() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int userid = prefs.getInt("userID");
  //   print(userid);
  //
  //   final param = {
  //     "user_id": userid.toString(),
  //   };
  //
  //   final response = await http.post(
  //     Uri.parse("http://157.230.228.250/remove-customer-profile-image-api/"),
  //     body: param,
  //   );
  //
  //   CommonData remove;
  //   print(response.statusCode);
  //   print(response.body);
  //   remove = new CommonData.fromJson(jsonDecode(response.body));
  //
  //   if (response.statusCode == 200) {
  //     if (remove.status == "success") {
  //       print(remove.status);
  //       showInSnackBar("Profile Picture removed successfully");
  //       setData(id, token);
  //     } else
  //       showInSnackBar(remove.message);
  //   } else {
  //     print(remove.status);
  //     showInSnackBar(remove.message);
  //     return null;
  //   }
  // }

  Future<void> sendData(File imageFile) async {
    List<int> imageByte = imageFile.readAsBytesSync();
    print(imageByte);
    String base64Img = base64Encode(imageByte);
    print(base64Img);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
  }
}

class HeaderGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: paint background radial gradient
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
