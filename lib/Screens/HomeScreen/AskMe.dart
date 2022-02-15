import 'dart:convert';
import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AskMe extends StatefulWidget {
  const AskMe({Key key}) : super(key: key);

  @override
  _AskMeState createState() => _AskMeState();
}

class _AskMeState extends State<AskMe> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Color suggestionContainerColor = Colors.green;
  Color suggestionTextColor = Colors.white;
  Color bugsContainerColor = Colors.white;
  Color bugsTextColor = Colors.green;
  String mobile, token;
  XFile _imageFile;
  bool isFileAvailable , isFilePdf;


  TextEditingController cmtController = new TextEditingController();

  int lastID;
  String sendDataArray = "";

  String userId;

  String language,upload,camera,gallery,write,question,send;
  String snack1,snack2,snack3;


  @override
  void initState() {
    isFileAvailable = false;
    isFilePdf = false;
    LastId();
    autoFill();
    super.initState();
  }


  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");

    switch (language) {
      case "Eng":
        upload = "Upload Image";
        camera = "Camera";
        gallery = "Gallery";
        write = "Write Your Question Here";
        question = "Question";
        send = "Send";
        snack1 = "Please Write Your Question";
        snack2 = "Question Submitted Successfully";
        snack3 = "Server Error";
        break;

      case "Mar":
        upload = "प्रतिमा अपलोड करा";
        camera = "कॅमेरा";
        gallery = "गॅलरी";
        write = "तुमचा प्रश्न इथे लिहा";
        question = "प्रश्न";
        send = "पाठवा";
        snack1 = "कृपया तुमचा प्रश्न लिहा";
        snack2 = "प्रश्न यशस्वीरित्या सबमिट केला";
        snack3 = "सर्व्हर त्रुटी";
        break;

      case "Hin":
        upload = "तस्वीर डालिये";
        camera = "कैमरा";
        gallery = "गेलरी";
        write = "अपना प्रश्न यहाँ लिखें";
        question = "प्रश्न";
        send = "भेजना";
        snack1 = "कृपया अपना प्रश्न लिखें";
        snack2 = "प्रश्न सफलतापूर्वक सबमिट किया गया";
        snack3 = "सर्वर त्रुटि";
        break;

      case "Gu":
        upload = "છબી અપલોડ કરો";
        camera = "કેમેરા";
        gallery = "ગેલેરી";
        write = "તમારો પ્રશ્ન અહીં લખો";
        question = "પ્રશ્ન";
        send = "મોકલો";
        snack1 = "કૃપા કરીને તમારો પ્રશ્ન લખો";
        snack2 = "પ્રશ્ન સફળતાપૂર્વક સબમિટ કર્યો";
        snack3 = "સર્વર ભૂલ";
        break;

      case "Kan":
        upload = "ಚಿತ್ರವನ್ನು ಅಪ್ಲೋಡ್ ಮಾಡಿ";
        camera = "ಕ್ಯಾಮೆರಾ";
        gallery = "ಗ್ಯಾಲರಿ";
        write = "ನಿಮ್ಮ ಪ್ರಶ್ನೆಯನ್ನು ಇಲ್ಲಿ ಬರೆಯಿರಿ";
        question = "ಪ್ರಶ್ನೆ";
        send = "ಕಳುಹಿಸು";
        snack1 = "ದಯವಿಟ್ಟು ನಿಮ್ಮ ಪ್ರಶ್ನೆಯನ್ನು ಬರೆಯಿರಿ";
        snack2 = "ಪ್ರಶ್ನೆಯನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಸಲ್ಲಿಸಲಾಗಿದೆ";
        snack3 = "ಸರ್ವರ್ ದೋಷ";
        break;

    }
    setState(() {});
  }

  Future<void> LastId() async {

    final res = await http.post(
      Uri.parse("https://www.zappkode.com/cicr/english/webservices/farmer_contact_centre/questionLastid"),
    );
    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      lastID = responseJson['lastid'];
      print("LAST_ID $lastID");
      return responseJson;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> sendApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("userID");

    if(cmtController.text.isEmpty){
      showInSnackBar(snack1);
      return null;
    }

    final param = {
      "farmer_id" : userId,
      "question" : cmtController.text,
      "image" : lastID.toString(),
    };

    final res = await http.post(
      Uri.parse("https://www.zappkode.com/cicr/english/webservices/farmer_contact_centre/saveQuestions"),
      body: param,
    );
    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      print(responseJson);
      cmtController.clear();
      _imageFile = null;
      showInSnackBar(snack2);
// Future.delayed(const Duration(seconds: 2),(){
// Navigator.of(context, rootNavigator: true).pop();
// });
      return responseJson;
    } else {
      showInSnackBar(snack3);
      throw Exception('Failed to load data');
    }
  }

// Future<void> image() async {
//
// final res = await http.post(
// Uri.parse("https://www.zappkode.com/cicr/english/webservices/farmer_contact_centre/questionLastid"),
// body: json.encode([lastID,_imageFile])
// );
// print(res.body);
// print(res.statusCode);
// var responseJson = json.decode(res.body);
// if (200 == res.statusCode) {
// lastID = responseJson['lastid'];
// print("LAST_ID $lastID");
// return responseJson;
// } else {
// throw Exception('Failed to load data');
// }
// }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.only(left: 10.0,top: 10.0),
              child: RichText(
                text: TextSpan(
                    text: upload ?? "",
                    style: TextStyle(
                      fontFamily: "PoppinsLight",
                      fontSize: 13.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '',
                        style: TextStyle(
                          color: Colors.green,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
              ),
            ),
            Card(
              color: Colors.white,
              elevation: 5,
              child: Container(
                height: size.height * 0.20,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                        left: MediaQuery.of(context).size.width / 1.2,
                        child: Visibility(
                          visible: isFileAvailable,
                          child: IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                setState(() {
                                  _imageFile = null;
                                  isFileAvailable = false;
                                  isFilePdf = false;
                                });
                              }),
                        )),
                    Center(
                      child: isFileAvailable
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: isFilePdf
                            ? Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.solidFilePdf,
                              color: Colors.red,
                              size: 50.0,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green)),
                                child: Text(path
                                    .basename(_imageFile.path))),
                          ],
                        )
                            : Column(
                          children: [
                            Image.file(
                              (File(_imageFile.path)),
                              key: ValueKey("CapturedImagePreview"),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.center,
                              height: size.height * 0.20,
                            ),
// Text(
// "${path.basename(_imageFile.path)} ${(int.parse(_imageFile.lengthSync().toString()) / 1024).toStringAsFixed(0)} kb"),
                          ],
                        ),
                      )
                          : Center(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new InkWell(
                              onTap: () {
                                print("camera");
                                _openCamera(context);
                              },
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.camera,
                                      color: Colors.white,
                                      size: size.width * 0.08,
                                    ),
                                    backgroundColor: Colors.green,
                                    radius: size.width * 0.06,
                                  ),
                                  SizedBox(
                                    height: size.width * 0.02,
                                  ),
                                  Text(
                                    camera ?? "",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.width * 0.05,
                                        fontFamily: "PoppinsLight",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),

                            new InkWell(
                              onTap: () {
                                print("Gallery");
                                _openGallery(context);
                              },
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    child: Icon(
                                      Icons.photo,
                                      color: Colors.white,
                                      size: size.width * 0.08,
                                    ),
                                    backgroundColor: Colors.green,
                                    radius: size.width * 0.06,
                                  ),
                                  SizedBox(
                                    height: size.width * 0.02,
                                  ),
                                  Text(
                                    gallery ?? "",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size.width * 0.05,
                                        fontFamily: "PoppinsLight",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.only(left: 10.0,top: 10.0),
              child: RichText(
                text: TextSpan(
                    text: write ?? "",
                    style: TextStyle(
                      fontFamily: "PoppinsLight",
                      fontSize: 13.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Colors.green,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: cmtController,
                textInputAction: TextInputAction.newline,
                maxLength: 200,
                maxLines: 10,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: question ?? "",
                  labelStyle: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15.0,
                      color: Colors.green),
                  alignLabelWithHint: true,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 30.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: size.width,
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
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
                    color: Colors.green
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        send ?? "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: "PoppinsMedium"),
                      ),
                    ),
                    onPressed: () {
                      sendApi();
                    }
                ),
              ),
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


  void _openGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile picture = await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 25);
    if (picture != null) {
      setState(() {
        _imageFile = picture;
        isFileAvailable = true;
      });
// _cropImage(picture);
    }
  }

  void _openCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile picture = await _picker.pickImage(
        source: ImageSource.camera, imageQuality: 25);
    if (picture != null) {
      setState(() {
        _imageFile = picture;
        isFileAvailable = true;
      });
// _cropImage(picture);
    }
  }
}