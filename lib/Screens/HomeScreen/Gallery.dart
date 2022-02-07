import 'package:cicr_flutter_app/Model/Model_gallary.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Gallery extends StatefulWidget {
  const Gallery({Key key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("43rd Foundation",textAlign: TextAlign.start,
                            style:TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            )),
              trailing:InkWell(
                        child: Container(
                          child: Text("View All",textAlign: TextAlign.end,
                              style:TextStyle(
                                fontSize: 15.0,
                                color: Colors.lightGreen,
                              ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GalleryDetail(),
                            ),
                          );
                        },
                      ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(12.0)
                  // ),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/one.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/five.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/nine.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text("CICR Kapas Mela",textAlign: TextAlign.start,
                  style:TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  )),
              trailing:InkWell(
                child: Container(
                  child: Text("View All",textAlign: TextAlign.end,
                      style:TextStyle(
                        fontSize: 15.0,
                        color: Colors.lightGreen,
                      )),
                ),
                onTap: (){},
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(12.0)
                  // ),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/one.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/five.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/nine.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
              ],
            ),
            ListTile(
              title:    Expanded(
                child: Container(
                  child: Text("Dissemination Of Pink Bollworm Management Strategies",textAlign: TextAlign.start,
                      style:TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      )),
                ),
              ),
              trailing:InkWell(
                child: Container(
                  child: Text("View All",textAlign: TextAlign.end,
                      style:TextStyle(
                        fontSize: 15.0,
                        color: Colors.lightGreen,
                      )),
                ),
                onTap: (){},
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(12.0)
                  // ),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/one.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/five.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/nine.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
              ],
            ),
            ListTile(
              title:    Expanded(
                child: Container(
                  child: Text("Exhibitions Interaction with farmers",textAlign: TextAlign.start,
                      style:TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      )),
                ),
              ),
              trailing:InkWell(
                child: Container(
                  child: Text("View All",textAlign: TextAlign.end,
                      style:TextStyle(
                        fontSize: 15.0,
                        color: Colors.lightGreen,
                      )),
                ),
                onTap: (){},
              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(12.0)
                  // ),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/one.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/five.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/nine.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
              ],
            ),
            ListTile(
              title:Expanded(
                child: Container(
                  child: Text("Hindi Workshop",textAlign: TextAlign.start,
                      style:TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      )),
                ),
              ),
              trailing:InkWell(
                child: Container(
                  child: Text("View All",textAlign: TextAlign.end,
                      style:TextStyle(
                        fontSize: 15.0,
                        color: Colors.lightGreen,
                      )),
                ),
                onTap: (){},
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(12.0)
                  // ),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/one.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/five.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/nine.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
              ],
            ),
            ListTile(
              title:Expanded(
                child: Container(
                  child: Text("IRM",textAlign: TextAlign.start,
                      style:TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      )),
                ),
              ),
              trailing:InkWell(
                child: Container(
                  child: Text("View All",textAlign: TextAlign.end,
                      style:TextStyle(
                        fontSize: 15.0,
                        color: Colors.lightGreen,
                      )),
                ),
                onTap: (){},
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(12.0)
                  // ),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/one.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/five.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/nine.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
              ],
            ),
            ListTile(
              title:Expanded(
                child: Container(
                  child: Text("Mera Gaon Mera Gaurav Farmers Lab Visit",textAlign: TextAlign.start,
                      style:TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      )),
                ),
              ),
              trailing:InkWell(
                child: Container(
                  child: Text("View All",textAlign: TextAlign.end,
                      style:TextStyle(
                        fontSize: 15.0,
                        color: Colors.lightGreen,
                      )),
                ),
                onTap: (){},
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(12.0)
                  // ),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/one.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/five.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/nine.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
              ],
            ),
            ListTile(
              title:Expanded(
                child: Container(
                  child: Text("Tribal Sub Plan",textAlign: TextAlign.start,
                      style:TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      )),
                ),
              ),
              trailing:InkWell(
                child: Container(
                  child: Text("View All",textAlign: TextAlign.end,
                      style:TextStyle(
                        fontSize: 15.0,
                        color: Colors.lightGreen,
                      )),
                ),
                onTap: (){},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5.0),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(12.0)
                  // ),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/one.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/five.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.green.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Image.asset("assets/nine.jpg",height: 100.0,width: 100.0,),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
class GalleryDetail extends StatefulWidget {
  const GalleryDetail({Key key}) : super(key: key);

  @override
  _GalleryDetailState createState() => _GalleryDetailState();
}

class _GalleryDetailState extends State<GalleryDetail> {


  Future<List<GalleryModel>> getBills() async {
    final res = await http.post(
      Uri.parse("https://www.zappkode.com/cicr/english/webservices/gallery/albumlist"),);
    print(res.body);
    print(res.statusCode);
    if (200 == res.statusCode) {
    } else {
      throw Exception('Failed to load Bills');
    }
  }
  @override
  Widget build(BuildContext context) {
    var _images;
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Gallery',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GalleryDetail(),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage("Assets/logo.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  // itemCount: _images.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
