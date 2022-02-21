import 'dart:convert';
import 'dart:io';
import 'package:cicr_flutter_app/Model/Model_Comment.dart';
import 'package:cicr_flutter_app/Model/Model_Discussion.dart';

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Profile.dart';

class DiscussionForum extends StatefulWidget {
  String title, name;

  DiscussionForum(this.title, this.name);

  @override
  _DiscussionForumState createState() => _DiscussionForumState();
}

class _DiscussionForumState extends State<DiscussionForum> {
  final ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController CMTcontroller = TextEditingController();

  String title, language,profile;
  String api, forum, apiComment, send;

  String topicId;

  String farmer;
  int fev;

  bool liked = false;

  @override
  void initState() {
    super.initState();
    autoFill();
    getTopicId();
    // getBills();
  }

  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");
    farmer = prefs.getString("fullName");
    profile = prefs.getString("profilePic");

    switch (language) {
      case "Eng":
        api =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/getForumTopics";
        forum = "Discussion Forum";
        apiComment =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/getCommentsByTopicId";
        send =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/addCommentForTopicId";
        break;

      case "Mar":
        api =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/getForumTopics";
        forum = "चर्चा मंच";
        apiComment =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/getCommentsByTopicId";
        send =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/addCommentForTopicId";
        break;

      case "Hin":
        api =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/getForumTopics";
        forum = "चर्चा मंच";
        apiComment =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/getCommentsByTopicId";
        send =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/addCommentForTopicId";
        break;

      case "Gu":
        api =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/getForumTopics";
        forum = "ચર્ચા મંચ";
        apiComment =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/getCommentsByTopicId";
        send =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/addCommentForTopicId";
        break;

      case "Kan":
        api =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/getForumTopics";
        forum = "ಚರ್ಚಾ ವೇದಿಕೆ";
        apiComment =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/getCommentsByTopicId";
        send =
        "https://www.zappkode.com/cicr/english/webservices/discussion_forum/addCommentForTopicId";
        break;
    }
    setState(() {});
  }

  Future<Discussion> getDisscussion() async {
    final res = await http.post(
      Uri.parse(api),
      // body: param
    );
    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      print(discussionFromJson(res.body).list.length);

      print(topicId);
      return discussionFromJson(res.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<DiscussionMain> getTopicId() async {
    // final param = {
    //   "year_id": widget.id,
    // };
    final res = await http.post(
      Uri.parse(api),
      // body: param
    );
    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      print(discussionFromJson(res.body).list.length);
      print(responseJson);

      return discussionMainFromJson(res.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<CommentMain> getCommentList(String id) async {
    final param = {
      "topic_id": id,
    };
    final res = await http.post(Uri.parse(apiComment), body: param);
    print(res.body);
    print(res.statusCode);
    // var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      print(commentMainFromJson(res.body).commentList.length);
      return commentMainFromJson(res.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> sendComment(String id) async {

    if(CMTcontroller.text.isEmpty){
      return null;
    }

    final param = {
      "topic_id": id,
      "farmer_name": farmer,
      "comment": CMTcontroller.text,
    };
    final res = await http.post(Uri.parse(send), body: param);
    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      if (responseJson['status'] == "Success") {
        getCommentList(id);
        return;
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(forum),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Question(widget.title,widget.name)));
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(5),
                        child: ListTile(
                          title: Text(widget.name,style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold)),
                          subtitle: Text("What Are Your Question?",style: TextStyle(color: Colors.red,fontSize: 12)),
                          leading: Container(
                            height: 100,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: NetworkImage(profile)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
            child: FutureBuilder<Discussion>(
              future: getDisscussion(),
              builder:
                  (BuildContext context, AsyncSnapshot<Discussion> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        )),
                  );
                else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Center(
                    child: Text("No Data Found !"),
                  );
                } else {
                  if (snapshot.hasData) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (_controller.hasClients) {
                        _controller.animateTo(
                            _controller.position.minScrollExtent,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.fastLinearToSlowEaseIn);
                      } else {
                        setState(() => null);
                      }
                    });
                    return Scrollbar(
                      isAlwaysShown: true,
                      controller: _controller,
                      thickness: 3.0,
                      child: ListView.builder(
                        // padding: const EdgeInsets.only(
                        //     bottom: kFloatingActionButtonMargin + 52),
                        shrinkWrap: true,
                        reverse: false,
                        controller: _controller,
                        itemBuilder: (bui, index) {
                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Card(
                                elevation: 3.0,
                                shadowColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 10.0),
                                  child: Column(
                                    children: [
                                      Container(
                                          padding:EdgeInsets.only(left: 15),
                                          child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot
                                                      .data.list[index].authorName,
                                                  style: TextStyle(
                                                      fontFamily: "PoppinsBold",
                                                      fontSize: 12.0),
                                                ),
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  snapshot.data.list[index].date,
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 8.0),
                                                ),
                                                SizedBox(height: 10.0,),
                                                Text(
                                                  snapshot.data.list[index].heading,
                                                  style: TextStyle(
                                                      fontFamily: "PoppinsMedium",
                                                      fontSize: 12.0),
                                                ),
                                                SizedBox(height: 10.0,),
                                                if (snapshot.data.list[index].file
                                                    .endsWith('.JPG'))
                                                  Center(
                                                      child: Container(margin: EdgeInsets.only(right: 30),
                                                          child: Image.network(
                                                            snapshot
                                                                .data
                                                                .list[index]
                                                                .file,height: 200.0,width: 200.0,fit: BoxFit.contain,))),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Card(
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(13.5),
                                                        child: StarButton(
                                                          valueChanged:
                                                              (_isFavorite) {
                                                            // setState(() {
                                                            // if(_isFavorite == false) {
                                                            // fev = 0;
                                                            // }else{
                                                            // fev = 1;
                                                            // }
                                                            // });
                                                          },
                                                          iconSize: 30.0,

                                                        ),
                                                      ),
                                                      // IconButton(
                                                      //   icon: liked? Icon(Icons.thumb_up,size: 15.0,): Icon(Icons.thumb_up_alt_outlined,size: 15.0,),
                                                      //   onPressed: (){
                                                      //     setState(() {
                                                      //       liked = true;
                                                      //     });
                                                      //
                                                      //   },
                                                      // ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                      ),
                                                      elevation: 0.0,
                                                    ),
                                                    Card(
                                                      elevation: 0.0,
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.comment,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            topicId = snapshot.data.list[index].id;
                                                          });
                                                          _showSelectionDialog(context, topicId);
                                                        },
                                                      ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                      ),
                                                    ),
                                                    Card(
                                                      elevation: 0.0,
                                                      child: IconButton(
                                                        icon: Icon(
                                                          Icons.share,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () {
                                                          Share.share(
                                                              'Let us chat on CICR Cotton App it is truly made for Farmers and made in India app released by CICR Nagpur. \n\nGet it at:https://bit.ly/2RuE3vA');
                                                        },
                                                      ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ])),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {},
                          );
                        },
                        itemCount: snapshot.data.list.length,
                      ),
                    );
                  } else //`snapShot.hasData` can be false if the `snapshot.data` is null
                    return Center(
                      child: Text("No Data Found"),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showSelectionDialog(BuildContext context, String id) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text("Comments"),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 400.0,
                      width: 300.0,
                      child: FutureBuilder<CommentMain>(
                        future: getCommentList(id),
                        builder: (BuildContext context,
                            AsyncSnapshot<CommentMain> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return Center(
                              child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.green),
                                  )),
                            );
                          else if (snapshot.hasError) {
                            print(snapshot.error);
                            return Center(
                              child: Text("No Data Found !"),
                            );
                          } else {
                            if (snapshot.hasData) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (_controller.hasClients) {
                                  _controller.animateTo(
                                      _controller.position.minScrollExtent,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                } else {
                                  setState(() => null);
                                }
                              });
                              return Scrollbar(
                                isAlwaysShown: true,
                                controller: _controller,
                                thickness: 3.0,
                                child: ListView.builder(
                                  // padding: const EdgeInsets.only(
                                  //     bottom: kFloatingActionButtonMargin + 52),
                                  shrinkWrap: true,
                                  reverse: false,
                                  controller: _controller,
                                  itemBuilder: (bui, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: new Card(
                                        elevation: 3.0,
                                        shadowColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                  child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                  .data
                                                                  .commentList[index]
                                                                  .commenterName,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  "PoppinsBold",
                                                                  fontSize: 12.0),
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data
                                                                  .commentList[index]
                                                                  .date,
                                                              style: TextStyle(
                                                                  color: Colors.red,
                                                                  fontSize: 8.0),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data
                                                              .commentList[index]
                                                              .comment,
                                                          style: TextStyle(
                                                              fontFamily:
                                                              "PoppinsMedium",
                                                              fontSize: 12.0),
                                                        ),
                                                        // if(snapshot.data.list[index].file.endsWith('.JPG'))
                                                        //   Center(child: Container(child: Image.network(snapshot.data.list[index].file))),
                                                        // Row(
                                                        //   mainAxisAlignment: MainAxisAlignment.end,
                                                        //   children: [
                                                        //     Card(
                                                        //       child: IconButton(
                                                        //         icon: Icon(Icons.thumb_up_alt_outlined),
                                                        //         onPressed: (){},
                                                        //       ),
                                                        //       shape: RoundedRectangleBorder(
                                                        //         borderRadius: BorderRadius.circular(15.0),
                                                        //       ),elevation: 5.0,
                                                        //     ),
                                                        //     Card(
                                                        //       elevation: 5.0,
                                                        //       child: IconButton(
                                                        //         icon: Icon(Icons.comment),
                                                        //         onPressed: (){
                                                        //           _showSelectionDialog(context);
                                                        //         },
                                                        //       ),
                                                        //       shape: RoundedRectangleBorder(
                                                        //         borderRadius: BorderRadius.circular(15.0),
                                                        //       ),
                                                        //     ),
                                                        //     Card(margin: EdgeInsets.all(10.0),
                                                        //       elevation: 5.0,
                                                        //       child: IconButton(
                                                        //         icon: Icon(Icons.share),
                                                        //         onPressed: (){
                                                        //           Share.share('Let us chat on CICR Cotton App it is truly made for Farmers and made in India app released by CICR Nagpur. \n\nGet it at:https://bit.ly/2RuE3vA');},
                                                        //       ),
                                                        //       shape: RoundedRectangleBorder(
                                                        //         borderRadius: BorderRadius.circular(15.0),
                                                        //       ),
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                      ])),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: snapshot.data.commentList.length,
                                ),
                              );
                            } else //`snapShot.hasData` can be false if the `snapshot.data` is null
                              return Center(
                                child: Text("No Data Found"),
                              );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Container(
                  height: 80.0,
                  width: 200.0,
                  child: TextField(
                    controller: CMTcontroller,
                    decoration:
                    InputDecoration(labelText: "Leave Your Comment Here"),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (CMTcontroller.text.isNotEmpty)
                        {
                          setState(() {
                            sendComment(topicId);
                          });
                          CMTcontroller.clear();
                          setState(() {});
                        }
                       else {
                        return null;
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.green,
                    ))
              ],
            );
          });
        });
  }
}

class Question extends StatefulWidget {
  String title, name;

  Question(this.title, this.name);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  File image;
  String queApi,language,farmer,farmerId;
  TextEditingController cmtCotroller = TextEditingController();


  @override
  void initState() {
    super.initState();
    autoFill();
    // getTopicId();
    // getBills();
  }

  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");
    farmer = prefs.getString("fullName");
    farmerId = prefs.getString("userID");

    switch (language) {
      case "Eng":
        queApi = "https://www.zappkode.com/cicr/english/webservices/discussion_forum/addForumTopics";

        break;

      case "Mar":
        queApi = "https://www.zappkode.com/cicr/english/webservices/discussion_forum/addForumTopics";

        break;

      case "Hin":
        queApi = "https://www.zappkode.com/cicr/english/webservices/discussion_forum/addForumTopics";

        break;

      case "Gu":
        queApi = "https://www.zappkode.com/cicr/english/webservices/discussion_forum/addForumTopics";

        break;

      case "Kan":
        queApi = "https://www.zappkode.com/cicr/english/webservices/discussion_forum/addForumTopics";

        break;
    }
    setState(() {});
  }

  Future<void> sendComment() async {

    if(cmtCotroller.text.isEmpty){
      return null;
    }

    final param = {
      "title": cmtCotroller.text,
      "farmername": farmer,
      "farmerid": farmerId,
      "file": "",
    };
    final res = await http.post(Uri.parse(queApi), body: param);
    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      if (responseJson['status'] == "Success") {
        // getCommentList(id);
        Navigator.pop(context);
        return;
      }
    } else {
      throw Exception('Failed to load data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Question"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,20,10,10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Question*",textAlign: TextAlign.left,)
              ),

              Container(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: cmtCotroller,
                  textInputAction: TextInputAction.newline,
                  maxLines: 4,
                  maxLength: 100,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Enter Your Question",
                    labelStyle: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15.0,
                        color: Colors.green),
                    alignLabelWithHint: true,
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 13.0, horizontal: 25.0),
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

              SizedBox(height: 20,),

              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Container(
                  height: 100,
                  width: 250,
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
// controller: cmtController,
                    textInputAction: TextInputAction.newline,
                    focusNode: new AlwaysDisabledFocusNode(),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Upload Photo",
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
                        suffixIcon: IconButton(onPressed: () {
                          _showSelectionDialog(context);
                        },
                            icon: Icon(Icons.attach_file,color: Colors.green,))
                    ),
                  ),
                ),
              ),


              if(image != null)
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Image.file(image,fit: BoxFit.fitHeight,)
                ),
              Center(
                child: MaterialButton(
                  color: Colors.green,
                  onPressed: (){
                    sendComment();
                    setState(() {});
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25,10,25,10),
                    child: Text("Submit",style: TextStyle(fontSize:16 ,color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
    final ImagePicker _picker = ImagePicker();

    final XFile picture = await _picker.pickImage(
        source: ImageSource.camera, imageQuality: 25);
    if (picture != null) {
      setState(() {
        image = File(picture.path);
      });
      Navigator.pop(context);
// sendData(File(picture.path));
    }
  }

  void _openGallery(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    final XFile picture = await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 25);
    if (picture != null) {
      setState(() {
        image = File(picture.path);
      });
      Navigator.pop(context);
// sendData(File(picture.path));
    }
  }

}