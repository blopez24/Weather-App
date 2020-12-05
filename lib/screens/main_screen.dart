import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/services/weather.dart';

import 'package:weather_app/components/weather_description.dart';
import 'package:weather_app/components/temperature_card.dart';
import 'package:weather_app/components/day_icons.dart';
import 'package:weather_app/components/svg_icon.dart';

import 'package:weather_app/components/hourly_graph.dart';

class MainScreen extends StatefulWidget {
  final weatherInfo;
  final upcomingInfo;
  MainScreen({this.weatherInfo, this.upcomingInfo});

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

  /// Holds the upcoming hourly weather
  List<Forecast> forecastHourly;

  /// Holds the upcoming daily weather
  List<Forecast> forecastDaily;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherInfo, widget.upcomingInfo);
  }

  /// Components are fed weather information parsed from the json data.
  void updateUI(dynamic weatherData, dynamic upcomingData) {
    var w = Weather(jsonWeatherData: weatherData);
    description = w.getDescription();
    iconID = w.getWeatherIconID();
    cityName = w.getCityName();

    temperature = w.getTemp();
    feelsTemperature = w.getFeelsTemp();
    minTemperature = w.getMinTemp();
    maxTemperature = w.getMaxTemp();

    times = w.getSunsetAndSunrise();

    w = Weather(jsonWeatherData: upcomingData);
    forecastHourly = w.getForecastHourly();
    forecastDaily = w.getForecastDaily();
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
                  height: safeHeight * 0.125,
                  width: safeWidth,
                  child: Row(
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
                  height: safeHeight * 0.375,
                  width: safeWidth,
                  child: SvgIcon(
                    id: iconID,
                    times: times,
                  ),
                ),

                /// ROW 3: Hourly Weather
                Container(
                  height: safeHeight * 0.225,
                  width: safeWidth,
                  color: Colors.greenAccent,

                  /// TODO: Look into graphs, this currently looks to ugly.
                  // child: HourIcons(
                  //   safeHeight: safeHeight,
                  //   safeWidth: safeWidth,
                  // ),
                  child: Center(
                    child: HourlyGraph(
                      safeHeight: safeHeight,
                      safeWidth: safeWidth,
                      forecast: forecastHourly,
                    ),
                  ),
                ),

                /// ROW 4: City's Name
                Container(
                  height: safeHeight * 0.075,
                  width: safeWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$cityName',
                        style: kMainTextStyle,
                      ),
                    ),
                  ),
                ),

                /// ROW 5: Current Weather / Daily Weather
                Container(
                  height: safeHeight * 0.20,
                  width: safeWidth,
                  child: Row(
                    children: [
                      /// Temperature (w/ feels like temperature)
                      TemperatureInfo(
                        safeHeight: safeHeight,
                        safeWidth: safeWidth,
                        temperature: temperature,
                        feelsTemperature: feelsTemperature,
                        minTemperature: minTemperature,
                        maxTemperature: maxTemperature,
                      ),

                      /// Next 3 Days Weather
                      DayIcons(
                        safeWidth: safeWidth,
                        safeHeight: safeHeight,
                        dailyForecast: forecastDaily,
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
