import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class TemperatureInfo extends StatelessWidget {
  const TemperatureInfo({
    Key key,
    @required this.safeWidth,
    @required this.safeHeight,
    @required this.temperature,
    @required this.feelsTemperature,
  }) : super(key: key);

  final double safeWidth;
  final double safeHeight;
  final int temperature;
  final int feelsTemperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: safeWidth * 0.4,
      child: Column(
        children: [
          Container(
            height: safeHeight * 0.2 * 0.75,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text(
                  '$temperature°',
                  style: kMainTextStyle,
                ),
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            height: safeHeight * 0.2 * 0.25,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
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
