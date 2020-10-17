import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: FittedBox(
        // TODO: Figure out how to pass image info.
        child: Image.asset('images/moon.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
