import 'package:cicr_flutter_app/ContactUs/Nagpur.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class TabContact extends StatelessWidget {
  int tabSelected;
  TabController controller;
  TabContact(this.tabSelected);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: tabSelected,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60.0,
            backgroundColor:  Colors.green,
            bottom: TabBar(
              indicatorColor: Colors.greenAccent,
              tabs: [
                Tab(text: 'NAGPUR'),
                Tab(text: 'COIMBATORE',),
                Tab(text: 'SIRSA',)
              ],
            ),
          ),

          body: TabBarView(
            children: [
              Nagpur(),
              Coimbatore(),
              Sirsa(),
            ],
          ),
        ),
      ),
    );
  }
}

class Coimbatore extends StatefulWidget {
  const Coimbatore({Key key}) : super(key: key);

  @override
  _CoimbatoreState createState() => _CoimbatoreState();
}

class _CoimbatoreState extends State<Coimbatore> {
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
              title: Text("ICAR- Central Institute For Cotton Research (R.S.),\nCoimbatore(Tamil Nadu), India, \nPin Code - 641003"),
              leading: Padding(
                padding: const EdgeInsets.only(top: 5.0),
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
                title: Text("04222430045"),
                leading: Icon(Icons.phone_android,size: 30,color: Colors.green,),
              ),
              onTap: (){
                launch("tel://04222430045");
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
              title: Text("04222454021"),
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
                title: Text("cicrbe@gmail.com"),
                leading: Icon(Icons.email_outlined,size: 30,color: Colors.green,),
              ),
              onTap: (){
                launch('mailto:cicrbe@gmail.com');
              },
            ),
          ),
        ],
      ),
    );
  }
}
class Sirsa extends StatefulWidget {
  const Sirsa({Key key}) : super(key: key);

  @override
  _SirsaState createState() => _SirsaState();
}

class _SirsaState extends State<Sirsa> {
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
              title: Text("ICAR- Central Institute For Cotton Research (R.S.),\nSirsa(Haryana), India, \nPin Code - 125055"),
              leading: Padding(
                padding: const EdgeInsets.only(top: 5.0),
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
                title: Text("01666220428"),
                leading: Icon(Icons.phone_android,size: 30,color: Colors.green,),
              ),
              onTap: (){
                launch("tel://01666220428");
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
              title: Text("01666230271"),
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
                title: Text("cicrsirsa@yahoo.co.in"),
                leading: Icon(Icons.email_outlined,size: 30,color: Colors.green,),
              ),
              onTap: (){
                launch('mailto:cicrsirsa@yahoo.co.in');
              },
            ),
          ),
        ],
      ),
    );
  }
}

