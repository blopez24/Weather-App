import 'package:flutter/material.dart';
import 'package:weather_app/components/svg_icon.dart';
import 'package:weather_app/constants.dart';

class DayIcon extends StatelessWidget {
  const DayIcon({
    Key key,
    @required this.safeWidth,
    @required this.safeHeight,
    @required this.temperature,
    @required this.iconID,
    @required this.date,
  }) : super(key: key);

  final double safeWidth, safeHeight;
  final int iconID;
  final int temperature;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: safeWidth * 0.6 * 0.3333,
      child: Column(
        children: [
          /// Temperature
          Container(
            height: safeHeight * 0.250 * 0.25,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FittedBox(
                child: Text(
                  ' $temperature°',
                  style: kMainTextStyle,
                ),
              ),
            ),
          ),

          /// Svg Icon
          Container(
              height: safeHeight * 0.25 * 0.50,
              width: double.infinity,
              child: SvgIcon(
                id: iconID,
                times: [],
              )),

          /// Date
          Container(
            height: safeHeight * 0.25 * 0.25,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FittedBox(
                child: Text(
                  date,
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
