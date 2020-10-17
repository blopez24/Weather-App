import 'package:flutter/material.dart';

class WeatherDescription extends StatelessWidget {
  const WeatherDescription({
    Key key,
    @required this.safeWidth,
    @required this.description,
  }) : super(key: key);

  final double safeWidth;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: safeWidth * 0.40,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FittedBox(
          child: Text(
            description,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
