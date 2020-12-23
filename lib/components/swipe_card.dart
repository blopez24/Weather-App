import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:weather_app/services/weather.dart';

import 'package:weather_app/components/temperature_card.dart';
import 'package:weather_app/components/day_icons.dart';

class SwipeCard extends StatelessWidget {
  const SwipeCard({
    Key key,
    @required this.safeHeight,
    @required this.safeWidth,
    @required this.temperature,
    @required this.feelsTemperature,
    @required this.minTemperature,
    @required this.maxTemperature,
    @required this.forecastDaily,
  }) : super(key: key);

  final double safeHeight;
  final double safeWidth;
  final int temperature;
  final int feelsTemperature;
  final int minTemperature;
  final int maxTemperature;
  final List<Forecast> forecastDaily;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: 2,
      index: 0,
      itemBuilder: (context, index) {
        if (index == 0) {
          return TemperatureInfo(
            safeHeight: safeHeight,
            safeWidth: safeWidth,
            temperature: temperature,
            feelsTemperature: feelsTemperature,
            minTemperature: minTemperature,
            maxTemperature: maxTemperature,
          );
        } else if (index == 1) {
          return DayIcons(
            safeWidth: safeWidth,
            safeHeight: safeHeight,
            dailyForecast: forecastDaily,
          );
        }
        return Container(
          width: 0,
          height: 0,
        );
      },
    );
  }
}
