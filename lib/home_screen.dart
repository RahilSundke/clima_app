import 'dart:convert';
import 'package:clima_app/get_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var apiUrl =
      "api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=ced3fdfcd12c7503e4847be70eaafb8a";
  var apikey = "ced3fdfcd12c7503e4847be70eaafb8a";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      getWeatherData();
    }
  }

  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/tejuimage.jfif'),
        fit: BoxFit.cover,
      )),
        child: SpinKitRipple(
          color: Colors.white,
          size: 200,
        ),
      ),
    );
  }

  void getWeatherData() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var lon = position.longitude;
    var apikey = "ced3fdfcd12c7503e4847be70eaafb8a";
    var apiUrl =
        "api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=ced3fdfcd12c7503e4847be70eaafb8a";
    var url = Uri.https("api.openweathermap.org", "/data/2.5/weather",
        {'lat': lat.toString(), 'lon': lon.toString(), 'appid': apikey});
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response.body);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => GetweatherScreen(weatherData: data)));
    }
  }
}
