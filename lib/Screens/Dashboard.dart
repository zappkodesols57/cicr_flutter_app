import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("CICR"),
      ),
      drawer: Drawer(
      ),
      body:  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 200.0,
                width: 350.0,
                child: Carousel(
                  radius: Radius.circular(20.0),
                  borderRadius:true ,
                  boxFit: BoxFit.cover,
                  autoplay: true,
                  dotSpacing: 8.0,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 5.0,
                  dotIncreasedColor: Color(0xFF4C853E),
                  dotBgColor: Colors.black26,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 2.0,
                  showIndicator: true,
                  indicatorBgPadding: 7.0,
                  images: [
                    AssetImage("assets/one.jpg"),
                    AssetImage("assets/two.jpg"),
                    AssetImage("assets/three.jpg"),
                    AssetImage("assets/four.jpg"),
                    AssetImage("assets/five.jpg"),
                    AssetImage("assets/six.jpg"),
                    AssetImage("assets/seven.jpg"),
                    AssetImage("assets/eight.jpg"),
                    AssetImage("assets/nine.jpg"),
                    AssetImage("assets/ten.jpg"),
                    AssetImage("assets/eleven.jpg"),
                    AssetImage("assets/twelve.jpg"),
                    AssetImage("assets/thirteen.jpg"),

                  ],
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}