import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Nagpur extends StatefulWidget {
  const Nagpur({Key key}) : super(key: key);

  @override
  _NagpurState createState() => _NagpurState();
}

class _NagpurState extends State<Nagpur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              shape: RoundedRectangleBorder(side: BorderSide(
                color: Colors.green
              ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              dense: false,
              title: Text("ICAR- Central Institute For Cotton Research, \nPost Bag No.2, Shankar Nagar PO, \nNagpur(Maharashtra), India, \nPin Code - 440010"),
              leading: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Icon(Icons.location_on,size: 30,color: Colors.green,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              child: ListTile(
                shape: RoundedRectangleBorder(side: BorderSide(
                    color: Colors.green
                ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                dense: false,
                title: Text("07103275536"),
                leading: Icon(Icons.phone_android,size: 30,color: Colors.green,),
              ),
              onTap: (){
                launch("tel://07103275536");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              shape: RoundedRectangleBorder(side: BorderSide(
                  color: Colors.green
              ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              dense: false,
              title: Text("07103275529"),
              leading: Icon(Icons.print,size: 30,color: Colors.green,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              child: ListTile(
                shape: RoundedRectangleBorder(side: BorderSide(
                    color: Colors.green
                ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                dense: false,
                title: Text("http://www.cicr.org.in"),
                leading: Icon(Icons.web,size: 30,color: Colors.green,),
              ),
              onTap: (){
                launch("http://www.cicr.org.in");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              child: ListTile(
                shape: RoundedRectangleBorder(side: BorderSide(
                    color: Colors.green
                ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                dense: false,
                title: Text("cicrnagpur@gmail.com"),
                leading: Icon(Icons.email_outlined,size: 30,color: Colors.green,),
              ),
              onTap: (){
                launch('mailto:cicrnagpur@gmail.com');
              },
            ),
          ),
        ],
      ),
    );
  }
}
