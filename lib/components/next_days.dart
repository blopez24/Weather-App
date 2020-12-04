import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';

import 'upcoming_day.dart';

class NextDays extends StatelessWidget {
  const NextDays({
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
      width: safeWidth * 0.6,
      child: Row(
        children: [
          /// +1 Day
          UpcomingDay(
            safeWidth: safeWidth,
            safeHeight: safeHeight,
            temperature: dailyForecast[0].getTemperature(),
            iconID: dailyForecast[0].getIcon(),
            date: dailyForecast[0].getTime(),
          ),

          /// +2 Day
          UpcomingDay(
            safeWidth: safeWidth,
            safeHeight: safeHeight,
            temperature: dailyForecast[1].getTemperature(),
            iconID: dailyForecast[1].getIcon(),
            date: dailyForecast[1].getTime(),
          ),

          /// +3 Day
          UpcomingDay(
            safeWidth: safeWidth,
            safeHeight: safeHeight,
            temperature: dailyForecast[2].getTemperature(),
            iconID: dailyForecast[2].getIcon(),
            date: dailyForecast[2].getTime(),
          ),
        ],
      ),
    );
  }
}
