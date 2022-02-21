import 'dart:math';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'Screens/UI/Login_Page.dart';

class Liquid_Swipes extends StatefulWidget {
  static final style = TextStyle(
      fontFamily: "Poppins-Bold",
      color: Colors.black,
      fontSize: 30.0,
      letterSpacing: 1.0);

  static final style1 = TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  @override
  _Liquid_SwipesState createState() => _Liquid_SwipesState();
}

class _Liquid_SwipesState extends State<Liquid_Swipes> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  // Future checkFirstSeen() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool _seen = (prefs.getBool('seen') ?? false);
  //
  //   if (_seen) {
  //     Navigator.of(context).pushReplacement(
  //         new MaterialPageRoute(builder: (context) => Customer_Login()));
  //   } else {
  //     await prefs.setBool('seen', true);
  //     Navigator.of(context).pushReplacement(
  //         new MaterialPageRoute(builder: (context) => Liquid_Swipes()));
  //   }
  // }
  //
  // @override
  // void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            // padding:
            // EdgeInsets.only(top: 0.0, bottom: 0.0, left: 35.0, right: 35.0),
            child: Image.asset(
              'assets/slider1.webp',
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    ),
    Center(
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            // padding:
            // EdgeInsets.only(top: 0.0, bottom: 0.0, left: 35.0, right: 35.0),
            child: Image.asset(
              'assets/slider2.webp',
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    ),
    Center(
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            // padding:
            // EdgeInsets.only(top: 0.0, bottom: 0.0, left: 35.0, right: 35.0),
            child: Image.asset(
              'assets/slider3.webp',
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
        ],
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Color(0xFF000000),
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe(
            pages: pages,
            enableLoop: false,
            onPageChangeCallback: pageChangeCallback,
            waveType: WaveType.liquidReveal,
            liquidController: liquidController,
            ignoreUserGestureWhileAnimating: true,
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length, _buildDot),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                onPressed: () {
                  if (page == 2) {
                    jump();
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return Customer_Login();
                    //     },
                    //   ),
                    // );
                  }
                  // liquidController.animateToPage(
                  //     page: pages.length - 1, duration: 500);
                  liquidController.jumpToPage(
                      page: liquidController.currentPage + 1);
                },
                child: (page == 2)
                    ? Text(
                  "Start",
                  style: Liquid_Swipes.style1,
                )
                    : Text(
                  "Next",
                  style: Liquid_Swipes.style1,
                ),
                // color: Colors.black.withOpacity(0.01),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                onPressed: () {
                  jump();
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return Customer_Login();
                  //     },
                  //   ),
                  // );
                },
                child: Text(
                  "Skip",
                  style: Liquid_Swipes.style1,
                ),
                // color: Colors.black.withOpacity(0.01),
              ),
            ),
          )
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }

  Future<void> jump() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool("intro", true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Login_Page();
        },
      ),
    );
  }
}
