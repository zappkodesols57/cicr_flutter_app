import 'dart:convert';
import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
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
  File _imageFile;
  bool _isFileAvailable, _isFilePdf;
  bool _isBug;

  TextEditingController cmtController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(
      //   title: Text('Feedback'),
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.arrow_back_ios),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
              child: Text("Select type of feedback",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "PoppinsMedium",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: cmtController,
                textInputAction: TextInputAction.newline,
                maxLength: 200,
                maxLines: 11,
                decoration: InputDecoration(
                  // prefixIcon: Icon(
                  //   Icons.comment,
                  //   color: kPrimaryColorBlue,
                  // ),
                  border: InputBorder.none,
                  labelText: 'Comments',
                  labelStyle: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15.0,
                      color: Colors.green),
                  alignLabelWithHint: true,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 30.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: size.width,
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
                    color: Colors.green
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: "PoppinsMedium"),
                      ),
                    ),
                    onPressed: () {
                     // submit();
                    }),
              ),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.only(left: 20.0),
              child: RichText(
                text: TextSpan(
                    text: 'Upload Bill ',
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
            Card(
              color: Colors.white,
              elevation: 5,
              child: Container(
                height: size.height * 0.26,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    // Positioned(
                    //   child: Visibility(
                    //     child: Container(
                    //       height: 100,
                    //       width: 300,
                    //       color: Colors.green,
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                        left: MediaQuery.of(context).size.width / 1.2,
                        child: Visibility(
                          visible: _isFileAvailable,
                          child: IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                setState(() {
                                  _imageFile.delete();
                                  _imageFile = null;
                                  _isFileAvailable = false;
                                  _isFilePdf = false;
                                });
                              }),
                        )),
                    Center(
                      child: _isFileAvailable
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: _isFilePdf
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
                              _imageFile,
                              key: ValueKey("CapturedImagePreview"),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.center,
                              height: 180,
                            ),
                            // Text(
                            //     "${path.basename(_imageFile.path)}  ${(int.parse(_imageFile.lengthSync().toString()) / 1024).toStringAsFixed(0)} kb"),
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
                                    "Camera",
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
                                    "Gallery",
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
          ],
        ),
      ),
    );
  }

  _showLoaderDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              content: new Container(
                height: 40.0,
                width: 40.0,
                child: Center(
                  child: SpinKitWave(
                    color: Colors.green,
                    size: 40.0,
                  ),
                ),
              ));
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

  // submit() async {
  //   if (cmtController.text.isEmpty) {
  //     showInSnackBar("Please enter you Feedback");
  //     return null;
  //   }
  //   if (_isBug == null) {
  //     showInSnackBar("Please Select Feedback type");
  //     return null;
  //   }
  //   _showLoaderDialog(context);
  //
  //   final param = {
  //     "mobile_no": mobile,
  //     "bug": _isBug.toString(),
  //     "suggestion": (!_isBug).toString(),
  //     "comments": cmtController.text,
  //   };
  //
  //   final response = await http.post(
  //     Uri.parse("http://157.230.228.250/customer-feedback-api/"),
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
  //     print("Submit Successful");
  //     print(data.status);
  //     if (data.status == "success") {
  //       Navigator.of(context, rootNavigator: true).pop();
  //       cmtController.clear();
  //       showInSnackBar("Feedback Submitted Successfully");
  //     } else showInSnackBar(data.status);
  //   } else {
  //     print(data.status);
  //     Navigator.of(context, rootNavigator: true).pop();
  //     showInSnackBar(data.status);
  //     return null;
  //   }
  // }

  void _openGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    final XFile picture= await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 25);
    if (picture != null) {
      // setState(() {
      //   _imageFile = picture;
      //   _isFileAvailable = true;
      // });
      _cropImage(picture);
    }
  }

  void _openCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    final XFile picture= await _picker.pickImage(
        source: ImageSource.camera, imageQuality: 20);
    if (picture != null) {
      // setState(() {
      //   _imageFile = picture;
      //   _isFileAvailable = true;
      // });
      _cropImage(picture);
    }
  }


  Future<Null> _cropImage(XFile picture) async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: picture.path,
        compressQuality: 50,
        aspectRatioPresets: Platform.isAndroid
        ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
        ]
            : [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
    CropAspectRatioPreset.ratio7x5,
    CropAspectRatioPreset.ratio16x9
    ],
    androidUiSettings: AndroidUiSettings(
    toolbarTitle: 'Crop',
    toolbarColor: Colors.green,
    toolbarWidgetColor: Colors.white,
    activeControlsWidgetColor: Colors.blue,
    initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: false),
    );

    if (croppedFile != null) {

    if(croppedFile.lengthSync().toInt()/1024 <500) {
    setState(() {
    _imageFile = croppedFile;
    _isFileAvailable = true;
    });
    // await Future.delayed(Duration(milliseconds: 1000), null);
    // showInSnackBar("Tap on Cancel button to select another picture", 5);
    }else{
    showInSnackBar("File size should be not more than 500 kb");
    }
    }
  }

}