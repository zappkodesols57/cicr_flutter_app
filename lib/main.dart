import 'package:cicr_flutter_app/Screens/HomeScreen/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp( MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CICR',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CICR',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}