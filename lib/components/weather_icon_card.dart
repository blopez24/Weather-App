import 'package:flutter/material.dart';

import 'package:weather_app/components/icon_card.dart';

class MainWeatherIcon extends StatelessWidget {
  const MainWeatherIcon({
    Key key,
    @required this.id,
    @required this.times,
  }) : super(key: key);

  final int id;
  final List<DateTime> times;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: FittedBox(
        child: IconCard(
          id: id,
          times: times,
        ),
        fit: BoxFit.contain,
      ),
    );
  }
}
