import 'package:flutter/material.dart';

class UpcomingDay extends StatelessWidget {
  const UpcomingDay({
    Key key,
    @required this.safeWidth,
    @required this.safeHeight,
    @required this.temperature,
    @required this.iconID,
  }) : super(key: key);

  final double safeWidth;
  final double safeHeight;
  final int iconID;
  final int temperature;

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

          /// Icon
          Container(
            height: safeHeight * 0.2 * 0.50,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Image.asset('images/moon.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// 3 Hour Prediction
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
