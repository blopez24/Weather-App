import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Holds the icon id matching the weather icon.
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

class SvgIcon extends StatelessWidget {
  /// Given a icon [number], it simplifies it to an available weather icon id.
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

  /// Given the sunrise and sunset times, return 0 if it is day time and 1 if it is night time.
  int dayNightHelper() {
    if (this.times.isEmpty) {
      return 0;
    }
    var sunrise = this.times[0];
    var sunset = this.times[1];
    var now = new DateTime.now();
    if (now.isBefore(sunrise) || now.isAfter(sunset)) {
      return 1;
    } else {
      return 0;
    }
  }

  /// Returns the weather icon string.
  String getImage() {
    int icon = iconDictHelper(this.id);
    int time = dayNightHelper();
    return 'images/${iconDictionary[icon][time]}.svg';
  }

  const SvgIcon({
    Key key,
    @required this.id,
    @required this.times,
  }) : super(key: key);

  final int id;
  final List<DateTime> times;

  @override
  Widget build(BuildContext context) {
    final String assetName = getImage();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FittedBox(
        child: SvgPicture.asset(
          assetName,
          color: Theme.of(context).accentColor,
        ),
        fit: BoxFit.contain,
      ),
    );
  }
}
