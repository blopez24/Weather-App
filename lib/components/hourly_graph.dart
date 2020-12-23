import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:weather_app/services/weather.dart';

List<Color> gradientColors = [
  Colors.white,
  Colors.white,
];

class HourlyGraph extends StatelessWidget {
  const HourlyGraph({
    Key key,
    @required this.safeHeight,
    @required this.safeWidth,
    @required this.forecast,
  }) : super(key: key);

  final double safeWidth, safeHeight;
  final List<Forecast> forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: safeHeight * 0.225,
      width: safeWidth,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: LineChart(
          weatherData(),
        ),
      ),
    );
  }

  double getMin() {
    var min = forecast[0].getTemperature();
    for (int i = 1; i < forecast.length; i++) {
      if (min > forecast[i].getTemperature()) {
        min = forecast[i].getTemperature();
      }
    }
    return min.toDouble();
  }

  double getMax() {
    var max = forecast[0].getTemperature();
    for (int i = 1; i < forecast.length; i++) {
      if (max < forecast[i].getTemperature()) {
        max = forecast[i].getTemperature();
      }
    }
    return max.toDouble();
  }

  LineChartData weatherData() {
    /// time as a string
    String time1 = forecast[0].getTime();
    String time2 = forecast[1].getTime();
    String time3 = forecast[2].getTime();
    String time4 = forecast[3].getTime();
    String time5 = forecast[4].getTime();
    String time6 = forecast[5].getTime();

    /// temperatures as an int
    int temp1 = forecast[0].getTemperature();
    int temp2 = forecast[1].getTemperature();
    int temp3 = forecast[2].getTemperature();
    int temp4 = forecast[3].getTemperature();
    int temp5 = forecast[4].getTemperature();
    int temp6 = forecast[5].getTemperature();

    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          show: true,
          spots: [
            /// (x,y) = (placement, temperature)
            FlSpot(1, temp1.toDouble()),
            FlSpot(4, temp2.toDouble()),
            FlSpot(7, temp3.toDouble()),
            FlSpot(10, temp4.toDouble()),
            FlSpot(13, temp5.toDouble()),
            FlSpot(16, temp6.toDouble()),
          ],
          colors: gradientColors,
          barWidth: 5.0,
          isCurved: true,
          dotData: FlDotData(
            show: false,
          ),
          isStepLineChart: false,
        ),
      ],
      titlesData: FlTitlesData(
        show: true,
        leftTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            return '';
          },
          reservedSize: 0,
          margin: 10,
        ),
        topTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '+0:00';
              case 4:
                return '+2:00';
              case 7:
                return '+4:00';
              case 10:
                return '+6:00';
              case 13:
                return '+8:00';
              case 16:
                return '+10:00';
            }
            return '';
          },
          reservedSize: 20,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            height: 1.0,
            letterSpacing: 1.0,
          ),
          margin: 1,
        ),
        rightTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            return '';
          },
          reservedSize: 0,
          margin: 10,
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return time1;
              case 4:
                return time2;
              case 7:
                return time3;
              case 10:
                return time4;
              case 13:
                return time5;
              case 16:
                return time6;
            }
            return '';
          },
          reservedSize: 20,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            height: 1.0,
            letterSpacing: 1.0,
          ),
        ),
      ),
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black,
          tooltipRoundedRadius: 45,
          tooltipPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          fitInsideHorizontally: true,
          fitInsideVertically: true,
        ),
        fullHeightTouchLine: true,
      ),
      gridData: FlGridData(
        // show: false,
        drawVerticalLine: true,
      ),
      borderData: FlBorderData(
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      minX: 0,
      maxX: 17,
      minY: getMin() - 1,
      maxY: getMax() + 1,
      backgroundColor: Colors.black,
    );
  }
}
