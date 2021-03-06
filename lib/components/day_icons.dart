import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';

import 'day_icon.dart';

class DayIcons extends StatelessWidget {
  const DayIcons({
    Key key,
    @required this.safeWidth,
    @required this.safeHeight,
    @required this.dailyForecast,
  }) : super(key: key);

  final double safeWidth;
  final double safeHeight;
  final List<Forecast> dailyForecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: safeWidth,
      child: Row(
        children: [
          /// +1 Day
          DayIcon(
            safeWidth: safeWidth,
            safeHeight: safeHeight,
            temperature: dailyForecast[0].getTemperature(),
            iconID: dailyForecast[0].getIcon(),
            date: dailyForecast[0].getTime(),
          ),

          /// +2 Day
          DayIcon(
            safeWidth: safeWidth,
            safeHeight: safeHeight,
            temperature: dailyForecast[1].getTemperature(),
            iconID: dailyForecast[1].getIcon(),
            date: dailyForecast[1].getTime(),
          ),

          /// +3 Day
          DayIcon(
            safeWidth: safeWidth,
            safeHeight: safeHeight,
            temperature: dailyForecast[2].getTemperature(),
            iconID: dailyForecast[2].getIcon(),
            date: dailyForecast[2].getTime(),
          ),

          /// +4 Day
          DayIcon(
            safeWidth: safeWidth,
            safeHeight: safeHeight,
            temperature: dailyForecast[3].getTemperature(),
            iconID: dailyForecast[3].getIcon(),
            date: dailyForecast[3].getTime(),
          ),

          /// +5 Day
          DayIcon(
            safeWidth: safeWidth,
            safeHeight: safeHeight,
            temperature: dailyForecast[4].getTemperature(),
            iconID: dailyForecast[4].getIcon(),
            date: dailyForecast[4].getTime(),
          ),
        ],
      ),
    );
  }
}
