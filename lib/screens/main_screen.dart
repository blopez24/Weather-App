import 'package:flutter/material.dart';

import 'package:weather_app/components/weather_description.dart';
import 'package:weather_app/components/weather_icon_card.dart';
import 'package:weather_app/components/temperature_card.dart';
import 'package:weather_app/components/predictions_card.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double safeWidth = MediaQuery.of(context).size.width - 20;
    double safeHeight =
        MediaQuery.of(context).size.height - padding.top - padding.bottom - 20;

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
                        description: 'Full Moon\nNight',
                      ),
                    ],
                  ),
                ),
                // Weather Icon
                Container(
                  height: safeHeight * .60,
                  width: safeWidth,
                  child: WeatherIcon(),
                ),
                // CityName, CountryName
                Container(
                  height: safeHeight * 0.05,
                  width: safeWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Moscow, Russia',
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
                        temperature: '79°',
                        feelsTemperature: 'feels like 77°',
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
