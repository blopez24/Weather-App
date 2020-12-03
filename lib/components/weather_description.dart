import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';

class WeatherDescription extends StatelessWidget {
  /// Formats the weather [description] into 1 or 2 lines, depending on the word count.
  String descriptionFormat(String description) {
    var words = description.split(' ');
    String format = '';

    if (words.length == 1) {
      format += words[0][0].toUpperCase() + words[0].substring(1);
    } else if (words.length == 2) {
      format += words[0][0].toUpperCase() +
          words[0].substring(1) +
          '\n' +
          words[1][0].toUpperCase() +
          words[1].substring(1);
    } else {
      for (int i = 0; i < words.length; i++) {
        if (i == 1) {
          format += words[i][0].toUpperCase() + words[i].substring(1) + '\n';
        } else {
          format += words[i][0].toUpperCase() + words[i].substring(1) + ' ';
        }
      }
    }

    return format;
  }

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
      width: safeWidth * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FittedBox(
          alignment: Alignment.centerLeft,
          child: Text(
            descriptionFormat(description),
            style: kMainTextStyle,
          ),
        ),
      ),
    );
  }
}
