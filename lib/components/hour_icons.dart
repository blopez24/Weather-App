import 'package:flutter/material.dart';

import 'package:weather_app/components/hour_icon.dart';

class HourIcons extends StatelessWidget {
  const HourIcons({
    Key key,
    @required this.safeHeight,
    @required this.safeWidth,
  }) : super(key: key);

  final double safeHeight;
  final double safeWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HourIcon(
          safeHeight: safeHeight,
          safeWidth: safeWidth,
          temperature: 0,
          icon: -1,
          hour: '',
        ),
        HourIcon(
          safeHeight: safeHeight,
          safeWidth: safeWidth,
          temperature: 0,
          icon: -1,
          hour: '',
        ),
        HourIcon(
          safeHeight: safeHeight,
          safeWidth: safeWidth,
          temperature: 0,
          icon: -1,
          hour: '',
        ),
        HourIcon(
          safeHeight: safeHeight,
          safeWidth: safeWidth,
          temperature: 0,
          icon: -1,
          hour: '',
        ),
        HourIcon(
          safeHeight: safeHeight,
          safeWidth: safeWidth,
          temperature: 0,
          icon: -1,
          hour: '',
        ),
        HourIcon(
          safeHeight: safeHeight,
          safeWidth: safeWidth,
          temperature: 0,
          icon: -1,
          hour: '',
        ),
      ],
    );
  }
}
