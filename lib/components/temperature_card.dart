import 'package:flutter/material.dart';

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
  final String temperature;
  final String feelsTemperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: safeWidth * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: safeHeight * 0.2 * 0.75,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  temperature,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: safeHeight * 0.2 * 0.25,
            width: safeWidth * 0.4 * .75,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text(
                  feelsTemperature,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
