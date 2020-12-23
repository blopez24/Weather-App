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
  /// The latitude of the phone's location.
  double latitude;

  /// The longitude of the phone's location.
  double longitude;

  /// The API key to connect to openweatherapi.com
  String apiKey;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  /// Fetches the location of the user and grabs the weather information.
  void getLocation() async {
    ApiKeyFetcher k = ApiKeyFetcher();
    apiKey = k.getApiKey();

    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = new NetworkHelper(
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=imperial");
    var todayWeather = await networkHelper.getData();

    NetworkHelper networkHelper2 = new NetworkHelper(
        "https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=current,minutely,alerts&appid=$apiKey&units=imperial");
    var forecastWeather = await networkHelper2.getData();

    Navigator.pop(context);

    /// Moves to the main screen, passing along the weather data.
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainScreen(
        weatherInfo: todayWeather,
        upcomingInfo: forecastWeather,
      );
    }));
  }

  /// Displays a loading spin kit wave.
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
