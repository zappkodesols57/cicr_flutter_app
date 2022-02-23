import 'dart:convert';

import 'package:cicr_flutter_app/Model/Model_Years.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class FactsAndFiguresYear extends StatefulWidget {
  String id,year;
  FactsAndFiguresYear(this.id,this.year);

  @override
  _FactsAndFiguresYearState createState() => _FactsAndFiguresYearState();
}

class _FactsAndFiguresYearState extends State<FactsAndFiguresYear> {
  final ScrollController _controller = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String title,language;
  String api;

  @override
  void initState() {
    super.initState();
    autoFill();
    // getBills();
  }


  Future<void> autoFill() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language");

    switch (language) {
      case "Eng":
        api = "http://zappkode.com/cicr/english/webservices/Facts_and_figures/get_facts_and_figures";
        break;

      case "Mar":
        api = "http://zappkode.com/cicr/marathi/webservices/Facts_and_figures/get_facts_and_figures";

        break;

      case "Hin":
        api = "http://zappkode.com/cicr/hindi/webservices/Facts_and_figures/get_facts_and_figures";

        break;

      case "Gu":
        api = "http://zappkode.com/cicr/gujarati/webservices/Facts_and_figures/get_facts_and_figures";

        break;

      case "Kan":
        api = "http://zappkode.com/cicr/kannada/webservices/Facts_and_figures/get_facts_and_figures";

        break;

    }
    setState(() {});
  }

  Future<Year> getYear() async {
    final param = {
      "year_id": widget.id,
    };
    final res = await http.post(
      Uri.parse(api),
        body: param
    );
    print(res.body);
    print(res.statusCode);
    var responseJson = json.decode(res.body);
    if (200 == res.statusCode) {
      print(yearFromJson(res.body).list.length);
      return yearFromJson(res.body);
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
        title: Text(widget.year),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Year>(
              future: getYear(),
              builder:
                  (BuildContext context, AsyncSnapshot<Year> snapshot) {
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
                        _controller.animateTo(_controller.position.minScrollExtent,
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
                            child: new Card(
                              elevation: 3.0,
                              shadowColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0,top: 10.0),
                                child:Column(
                                  children: [
                                    Text(snapshot.data.list[index].name,style: TextStyle(fontWeight: FontWeight.bold,
                                        fontFamily: "PoppinsBold",color: Colors.green),),
                                    Container(child: Image.network(snapshot.data.list[index].file,height: 100.0,width: MediaQuery.of(context).size.width,fit: BoxFit.fill,)),
                                  ],
                                ),
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Phone(snapshot.data.list[index].name,snapshot.data.list[index].file
                                          )));
                            },
                          );
                        },
                        itemCount: snapshot.data.list.length,
                      ),
                    );
                  } else //`snapShot.hasData` can be false if the `snapshot.data` is null
                    return Center(
                      child: Text("No Data Found"),
                    );}
              },
            ),
          ),
        ],
      ),
    );
  }
}
class Phone extends StatefulWidget {
  String name, file;
  Phone(this.name,this.file);

  @override
  _PhoneState createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,style: TextStyle(
          fontSize: 15.0
        ),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body:  Center(
        child:  PhotoViewGallery.builder(scrollPhysics: NeverScrollableScrollPhysics(),
            backgroundDecoration: BoxDecoration(
                color: Colors.black
            ),
            itemCount: widget.file.length,
            builder: (BuildContext context, int index){
              return PhotoViewGalleryPageOptions(disableGestures: false,
                  imageProvider: NetworkImage(widget.file),
                  initialScale: PhotoViewComputedScale.contained,
                  heroAttributes: PhotoViewHeroAttributes(
                      tag: widget.file)
              );
            }
        ),
      ),
    );
  }

}

