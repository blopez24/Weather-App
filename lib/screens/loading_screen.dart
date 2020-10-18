import 'package:flutter/material.dart';

import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/services/key.dart';

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
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold();
  }
}

// double temperature = decodedData['main']['temp'];
// int condition = decodedData['weather'][0]['id'];
// String cityName = decodedData['name'];
//
// print(temperature);
// print(condition);
// print(cityName);
