import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Weather extends StatefulWidget {
  const Weather({Key key}) : super(key: key);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String cityName;

  double temp = 0.0;
  double feels = 0.0;
  double max = 0.0;
  double min = 0.0;
  int humid = 0;
  String weather = "";


  @override
  void initState() {
    validateweather();
  }

  Future<void> validateweather() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

     cityName = "Nagpur" ;


    final response = await http.get(
      Uri.parse("https://api.openweathermap.org/data/2.5/weather?q="+cityName+"&units=metric&appid=03a5bfdc4ea08ec3aa0b01fc2aa7203a"));

    var responseJson = json.decode(response.body);
    print(response.body);

    if(response.statusCode == 200) {
      setState(() {
        temp = responseJson['main']['temp'];
        feels = responseJson['main']['feels_like'];
        humid = responseJson['main']['humidity'];
        max = responseJson['main']['temp_max'];
        min = responseJson['main']['temp_min'];
        weather = responseJson['weather'][0]['description'];
      });
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecast"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green.shade200,
              Colors.green.shade800
            ]
          )
        ),
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30.0),
                  alignment: Alignment.center,
                  child: Text("Nagpur",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: Text(weather,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Icon(
                    FontAwesomeIcons.cloudSun,
                    color: Colors.white,
                    size: 80.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: Text("${temp}°c",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: Text("Feels Like ${feels}°c",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: Text("Humidity ${humid}%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: Text("Min ${min}°c",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: Text("Max ${max}°c",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
