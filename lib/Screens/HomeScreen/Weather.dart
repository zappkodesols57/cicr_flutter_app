import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Weather extends StatefulWidget {
  String cityName = "";
  Weather(this.cityName);

  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {

  double temp = 0.0;
  double feels = 0.0;
  double max = 0.0;
  double min = 0.0;
  int humid = 0;
  String weather = "";

  double wind = 0.0;


  @override
  void initState() {
    validateweather();
  }

  Future<void> validateweather() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();



    final response = await http.get(
        Uri.parse("https://api.openweathermap.org/data/2.5/weather?q="+widget.cityName+"&units=metric&appid=03a5bfdc4ea08ec3aa0b01fc2aa7203a"));

    var responseJson = json.decode(response.body);
    print(response.body);

    if(response.statusCode == 200) {
      setState(() {
        temp = responseJson['main']['temp'];
        feels = responseJson['main']['feels_like'];
        humid = responseJson['main']['humidity'];
        max = responseJson['main']['temp_max'];
        min = responseJson['main']['temp_min'];
        weather = responseJson['weather'][0]['main'];
        wind = responseJson['wind']['speed'];
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
          image: DecorationImage(
              image: AssetImage("assets/mountain.jpg"),
              fit: BoxFit.fill,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 60.0),
                  alignment: Alignment.center,
                  child: Text(widget.cityName,
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      color: Colors.white,
                      fontSize: 35.0,
                    ),
                  ),
                ),
// Container(
// padding: EdgeInsets.only(top: 10.0),
// child: Icon(
// FontAwesomeIcons.cloudSun,
// color: Colors.white,
// size: 80.0,
// ),
// ),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 40.0,bottom: 0.0),
                      alignment: Alignment.bottomCenter,
                      child: Text("${temp.toInt()}°c",
                        style: TextStyle(
                          fontFamily: "PoppinsBold",
                          color: Colors.white,
                          fontSize: 70.0,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 110,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(right: 20.0),
                        alignment: Alignment.center,
                        child: Text("---------",
                          style: TextStyle(
                            fontFamily: "PoppinsBold",
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  alignment: Alignment.center,
                  child: Text(weather,
                    style: TextStyle(
                      fontFamily: "PoppinsMedium",
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  alignment: Alignment.center,
                  child: Text("Wind $wind kmpl",
                    style: TextStyle(
                      fontFamily: "PoppinsMedium",
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        alignment: Alignment.center,
                        child: Text("Feels Like ${feels.toInt()}°c",
                          style: TextStyle(
                            fontFamily: "PoppinsMedium",
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0),
                        alignment: Alignment.center,
                        child: Text("Humidity ${humid}%",
                          style: TextStyle(
                            fontFamily: "PoppinsMedium",
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),

                    ],
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