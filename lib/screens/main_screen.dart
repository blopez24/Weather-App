import 'package:flutter/material.dart';

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
  String description;
  int iconID;
  String cityName;
  int temperature;
  int feelsTemperature;
  int minTemperature;
  int maxTemperature;
  int sunriseUTC;
  int sunsetUTC;

  List<DateTime> times;

  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherInfo);
  }

  void updateUI(dynamic weatherData) {
    description = weatherData['weather'][0]['description'];
    iconID = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    temperature = weatherData['main']['temp'].toInt();
    feelsTemperature = weatherData['main']['feels_like'].toInt();

    minTemperature = weatherData['main']['temp_min'].toInt();
    maxTemperature = weatherData['main']['temp_max'].toInt();

    sunriseUTC = weatherData['sys']['sunrise'];
    sunsetUTC = weatherData['sys']['sunset'];

    // print('$description\n$iconID\n$cityName\n$temperature\n$feelsTemperature');
    // print('$minTemperature\n$maxTemperature\n$sunrise\n$sunset');
    var sunrise = new DateTime.fromMillisecondsSinceEpoch(sunriseUTC * 1000);
    var sunset = new DateTime.fromMillisecondsSinceEpoch(sunsetUTC * 1000);
    print('$sunrise, $sunset');
    // times.add(sunrise);
    // times.add(sunset);
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double safeWidth = MediaQuery.of(context).size.width - 20;
    double safeHeight = MediaQuery.of(context).size.height - padding.top - padding.bottom - 20;

    return Scaffold(
      // backgroundColor: Color(0xff474562),
      backgroundColor: Colors.black,
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // Weather Description
                Container(
                  height: safeHeight * 0.15,
                  width: safeWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WeatherDescription(
                        safeWidth: safeWidth,
                        description: description,
                      ),
                    ],
                  ),
                ),
                // Weather Icon
                Container(
                  height: safeHeight * .575,
                  width: safeWidth,
                  child: MainWeatherIcon(id: iconID, times: times),
                ),
                // CityName, CountryName
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
                        ),
                      ),
                    ),
                  ),
                ),
                // Bottom Bar Info
                Container(
                  height: safeHeight * 0.2,
                  width: safeWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Temperature (w/ feels like temperature)
                      TemperatureInfo(
                        safeWidth: safeWidth,
                        safeHeight: safeHeight,
                        temperature: '$temperature°',
                        feelsTemperature: 'feels like $feelsTemperature°',
                      ),
                      // 3 Upcoming  Temperatures
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
