import 'package:cicr_flutter_app/AppIntro.dart';
import 'package:cicr_flutter_app/Screens/UI/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'Screens/UI/Language.dart';

class Opacityanimate extends StatefulWidget {
  @override
  _OpacityanimateState createState() => _OpacityanimateState();
}

class _OpacityanimateState extends State<Opacityanimate> {
  Tween<double> tween = Tween(begin: 0.0, end: 1.0);

  String language;

  @override
  Widget build(BuildContext context) {
    Size size = Get.mediaQuery.size;
    return Center(
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 4),
        tween: tween,
        builder: (BuildContext context, double value, Widget child) {
          return Opacity(
              opacity: value,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 190,
                  width: 190,
                ),
              ],
            ),
          );
        },
        onEnd: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          language = prefs.getString("language");
          print(language);

            Get.off(language == null ? Language() : Login_Page());
        },

      ),
    );
  }
}
