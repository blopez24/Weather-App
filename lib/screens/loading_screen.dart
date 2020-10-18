import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/services/key.dart';

import 'package:weather_app/screens/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  String apiKey;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    ApiKeyFetcher k = ApiKeyFetcher();
    apiKey = k.getApiKey();

    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = new NetworkHelper(
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=imperial");

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainScreen(
        weatherInfo: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
