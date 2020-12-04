import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

import 'package:weather_app/components/svg_icon.dart';

class HourIcon extends StatelessWidget {
  const HourIcon({
    Key key,
    @required this.safeHeight,
    @required this.safeWidth,
    @required this.temperature,
    @required this.icon,
    @required this.hour,
  }) : super(key: key);

  final double safeHeight, safeWidth;
  final int temperature, icon;
  final String hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: safeHeight * 0.225 * 0.3,
            width: safeWidth * 0.166,
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0, top: 1.0, right: 2.0, bottom: 1.0),
              child: FittedBox(
                child: Text(
                  /// TODO: Replace with temperature variable
                  ' 01°',
                  style: kGreyTextStyle,
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
          Container(
            height: safeHeight * 0.225 * 0.4,
            width: safeWidth * 0.166,
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2.0),
              child: SvgIcon(
                id: -1,
                times: [],
              ),
            ),
          ),
          Container(
            height: safeHeight * 0.225 * 0.3,
            width: safeWidth * 0.166,
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0, top: 1.0, right: 2.0, bottom: 1.0),
              child: FittedBox(
                child: Text(
                  /// TODO: Replace with hour variable
                  '2:00',
                  style: kGreyTextStyle,
                ),
                alignment: Alignment.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
