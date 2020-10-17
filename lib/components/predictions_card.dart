import 'package:flutter/material.dart';

class UpcomingPrediction extends StatelessWidget {
  const UpcomingPrediction({
    Key key,
    @required this.safeWidth,
    @required this.safeHeight,
    @required this.time,
    @required this.temperature,
  }) : super(key: key);

  final double safeWidth;
  final double safeHeight;
  final String time;
  // TODO: ICON
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: safeWidth * 0.6 * 0.33,
      child: Column(
        children: [
          // SizeBox Equivalent
          Container(
            height: safeHeight * 0.2 * 0.15,
            width: double.infinity,
          ),
          // 3 Hour Prediction
          Container(
            height: safeHeight * 0.2 * 0.266,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // Icon
          Container(
            height: safeHeight * 0.2 * 0.266,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Image.asset('images/cloud.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Temperature
          Container(
            height: safeHeight * 0.2 * 0.266,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text(
                  temperature,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // SizeBox Equivalent
          Container(
            height: safeHeight * 0.2 * 0.05,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
