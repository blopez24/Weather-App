import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';

import 'package:weather_app/components/weather_description.dart';
import 'package:weather_app/components/weather_icon_card.dart';
import 'package:weather_app/components/temperature_card.dart';
import 'package:weather_app/components/predictions_card.dart';

class MainScreen extends StatefulWidget {
  final weatherInfo;
  MainScreen({this.weatherInfo});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// The current weather description and city's name of the phone's location.
  String description, cityName;

  /// Current weather icon id.
  int iconID;

  /// The current temperature, feels like temperature, lowest temperature, and highest temperature.
  int temperature, feelsTemperature, minTemperature, maxTemperature;

  /// The universal time of sunrise and sunset.
  int sunriseUTC, sunsetUTC;

  /// Holds the sunrise and sunset times.
  List<DateTime> times;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherInfo);
  }

  /// Components are fed weather information parsed from the json data.
  void updateUI(dynamic weatherData) {
    var w = Weather(jsonWeatherData: weatherData);

    description = w.getDescription();
    iconID = w.getWeatherIconID();
    cityName = w.getCityName();

    temperature = w.getTemp();
    feelsTemperature = w.getFeelsTemp();
    minTemperature = w.getMinTemp();
    maxTemperature = w.getMaxTemp();

    times = w.getSunsetAndSunrise();
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double safeWidth = MediaQuery.of(context).size.width - 20;
    double safeHeight = MediaQuery.of(context).size.height - padding.top - padding.bottom - 20;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                /// ROW 1: Weather Description
                Container(
                  height: safeHeight * 0.15,
                  width: safeWidth,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WeatherDescription(
                        safeWidth: safeWidth,
                        description: description,
                      ),
                    ],
                  ),
                ),

                /// ROW 2: Weather Icon
                Container(
                  height: safeHeight * .575,
                  width: safeWidth,
                  child: MainWeatherIcon(id: iconID, times: times),
                ),

                /// ROW 3: City's Name
                Container(
                  height: safeHeight * 0.075,
                  width: safeWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$cityName',
                        style: TextStyle(
                          color: Colors.white,
                          height: 1,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),

                /// ROW 4: Weather Temperature / Upcoming Weather
                Container(
                  height: safeHeight * 0.2,
                  width: safeWidth,
                  child: Row(
                    children: [
                      /// Temperature (w/ feels like temperature)
                      TemperatureInfo(
                        safeWidth: safeWidth,
                        safeHeight: safeHeight,
                        temperature: temperature,
                        feelsTemperature: feelsTemperature,
                      ),

                      /// 3 Upcoming  Temperatures
                      Container(
                        height: double.infinity,
                        width: safeWidth * 0.6,
                        child: Row(
                          children: [
                            // +3 Hour
                            UpcomingPrediction(
                              safeWidth: safeWidth,
                              safeHeight: safeHeight,
                              time: '06:00',
                              // TODO: Weather Icon
                              temperature: '76°',
                            ),
                            // +6 Hour
                            UpcomingPrediction(
                              safeWidth: safeWidth,
                              safeHeight: safeHeight,
                              time: '09:00',
                              temperature: '70°',
                            ),
                            // +9 Hour
                            UpcomingPrediction(
                              safeWidth: safeWidth,
                              safeHeight: safeHeight,
                              time: '12:00',
                              temperature: '64°',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
