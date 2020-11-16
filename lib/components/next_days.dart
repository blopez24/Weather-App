import 'package:flutter/material.dart';

import 'upcoming_day.dart';

class NextDays extends StatelessWidget {
  const NextDays({
    Key key,
    @required this.safeWidth,
    @required this.safeHeight,
    @required this.dayOneTemp,
    @required this.dayOneIconID,
    @required this.dayTwoTemp,
    @required this.dayTwoIconID,
    @required this.dayThreeTemp,
    @required this.dayThreeIconID,
  }) : super(key: key);

  final double safeWidth;
  final double safeHeight;
  final int dayOneTemp, dayTwoTemp, dayThreeTemp;
  final int dayOneIconID, dayTwoIconID, dayThreeIconID;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: safeWidth * 0.6,
      child: Row(
        children: [
          /// +1 Day
          UpcomingDay(
            safeWidth: safeWidth,
            safeHeight: safeHeight,
            temperature: dayOneTemp,
            iconID: dayOneIconID,
          ),

          /// +2 Day
          UpcomingDay(
            safeWidth: safeWidth,
            safeHeight: safeHeight,
            temperature: dayTwoTemp,
            iconID: dayTwoIconID,
          ),

          /// +3 Day
          UpcomingDay(
            safeWidth: safeWidth,
            safeHeight: safeHeight,
            temperature: dayThreeTemp,
            iconID: dayThreeIconID,
          ),
        ],
      ),
    );
  }
}
