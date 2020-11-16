import 'package:flutter/material.dart';
import 'package:weather_app/components/svg_icon.dart';

class UpcomingDay extends StatelessWidget {
  const UpcomingDay({
    Key key,
    @required this.safeWidth,
    @required this.safeHeight,
    @required this.temperature,
    @required this.iconID,
    @required this.times,
  }) : super(key: key);

  final double safeWidth, safeHeight;
  final int iconID;
  final int temperature;
  final List<DateTime> times;

  /// TODO: ICON

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: safeWidth * 0.6 * 0.3333,
      child: Column(
        children: [
          /// Temperature
          Container(
            height: safeHeight * 0.2 * 0.25,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text(
                  '$temperature°',
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.5,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ),

          /// Svg Icon
          Container(
              height: safeHeight * 0.2 * 0.50,
              width: double.infinity,
              child: SvgIcon(
                id: iconID,
                times: times,
              )),

          /// Date
          Container(
            height: safeHeight * 0.2 * 0.25,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text(
                  '00/01',
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.5,
                    letterSpacing: 1.0,
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
