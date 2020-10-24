import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const iconDictionary = {
  200: [
    'thunderstorm_day',
    'thunderstorm_night',
  ],
  300: [
    'drizzle_day',
    'night_day',
  ],
  500: [
    'rain_day',
    'rain_night',
  ],
  600: [
    'snow_day',
    'snow_night',
  ],
  700: [
    'atmosphere_day',
    'atmosphere_night',
  ],
  800: [
    'clear_day',
    'clear_night',
  ],
  801: [
    'clouds_day',
    'clouds_night',
  ],
  -1: [
    'unknown',
  ],
};

class IconCard extends StatelessWidget {
  int iconDictHelper(int number) {
    if (number >= 200 && number <= 232) {
      return 200;
    } else if (number >= 300 && number <= 321) {
      return 300;
    } else if (number >= 500 && number <= 521) {
      return 500;
    } else if (number >= 600 && number <= 622) {
      return 600;
    } else if (number >= 700 && number <= 781) {
      return 700;
    } else if (number == 800) {
      return 800;
    } else if (number >= 801 && number <= 804) {
      return 801;
    } else {
      return -1;
    }
  }

  // TODO: IMPLEMENT LATER
  int dayNightHelper(var sunrise, var sunset) {
    return -1;
  }

  const IconCard({
    Key key,
    @required this.id,
    @required this.times,
  }) : super(key: key);

  final int id;
  final List<DateTime> times;

  @override
  Widget build(BuildContext context) {
    final String assetName = 'images/clouds_day.svg';
    final Widget svg = SvgPicture.asset(
      assetName,
      color: Colors.white,
      semanticsLabel: 'Broken Clouds',
    );
    return svg;
  }
}
