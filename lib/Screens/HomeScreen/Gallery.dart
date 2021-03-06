import 'package:cicr_flutter_app/Model/Model_gallary.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'GalleryDetail.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final ScrollController _controller = ScrollController();
      @override
      void initState() {
        getAlbum();
      }

  Future<GalleryModel> getAlbum() async {
    final res = await http.post(
      Uri.parse("https://www.zappkode.com/cicr/english/webservices/gallery/albumlist"));
    print(res.body);
    print(res.statusCode);
    if (200 == res.statusCode) {
      return galleryFromJson(res.body);
    } else {
      throw Exception('Failed to load Bills');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: FutureBuilder<GalleryModel>(
        future: getAlbum(),
        builder: (BuildContext context, AsyncSnapshot<GalleryModel> snapshot) {
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
                    itemCount: snapshot.data.gallery.length,
                    shrinkWrap: true,
                    reverse: false,
                    controller: _controller,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
                          child: Hero(
                            tag: snapshot.data.gallery[index].id.toString(),
                            child: new Card(
                              elevation: 5.0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: ListTile(
                                  dense: true,
                                  title: Text(
                                      snapshot.data.gallery[index].name,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: "PoppinsMedium",
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold)),
                                  leading: Container(
                                    width: 60,
                                    height: 60,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshot.data.gallery[index].file),
                                      radius: 20.0,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios_sharp,
                                      color: Colors.green),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GalleryDetail(snapshot.data.gallery[index].name)));
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            } else //`snapShot.hasData` can be false if the `snapshot.data` is null
              return Center(
                child: Text("No Data Found"),
              );
          }
        },
      )
    );
  }
}
