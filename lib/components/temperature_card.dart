import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class TemperatureInfo extends StatelessWidget {
  const TemperatureInfo({
    Key key,
    @required this.safeHeight,
    @required this.safeWidth,
    @required this.temperature,
    @required this.feelsTemperature,
    @required this.minTemperature,
    @required this.maxTemperature,
  }) : super(key: key);

  final double safeHeight, safeWidth;
  final int temperature, feelsTemperature, minTemperature, maxTemperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: safeWidth * 0.4,
      child: Column(
        children: [
          Container(
            height: safeHeight * 0.2 * 0.60,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: FittedBox(
                child: Text(
                  ' $temperature°',
                  style: kMainTextStyle,
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
          Container(
            height: safeHeight * 0.2 * 0.20,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: FittedBox(
                child: Text(
                  '$maxTemperature° | $minTemperature°',
                  style: kMainTextStyle,
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
          Container(
            height: safeHeight * 0.2 * 0.20,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: FittedBox(
                child: Text(
                  'feels like $feelsTemperature°',
                  style: kMainTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
