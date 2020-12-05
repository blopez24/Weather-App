import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:weather_app/services/weather.dart';

//https://pub.dev/packages/fl_chart
List<Color> gradientColors = [
  const Color(0xff23b6e6),
  const Color(0xff02d39a),
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

  LineChartData weatherData() {
    return LineChartData(
      lineBarsData: [
        LineChartBarData(
          show: true,
          spots: [
            FlSpot(10, 50),
            FlSpot(12, 53),
            FlSpot(14, 53),
            FlSpot(16, 52),
            FlSpot(18, 52),
            FlSpot(20, 53),
          ],
          colors: gradientColors,
          barWidth: 5.0,
          isCurved: true,
          dotData: FlDotData(
            show: false,
          ),
          // dashArray: [5, 1], // Maybe ?
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
              case 10:
                return '50°';
              case 12:
                return '53°';
              case 14:
                return '53°';
              case 16:
                return '52°';
              case 18:
                return '52°';
              case 20:
                return '53°';
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
              case 10:
                return '11:00';
              case 12:
                return '1:00';
              case 14:
                return '3:00';
              case 16:
                return '5:00';
              case 18:
                return '7:00';
              case 20:
                return '9:00';
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
          // interval: // Don't know
          // rotateAngle: // Don't know
          // checkToShowTitle: // Don't know
        ),
      ),
      // extraLinesData: , // Not needed
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
          tooltipRoundedRadius: 45,
          tooltipPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          // tooltipBottomMargin: 16, // Default value
          // maxContentWidth: // Not needed
          // getTooltipItems: // Not needed
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          // showOnTopOfTheChartBoxArea: false, // Default value
        ),
        // getTouchedSpotIndicator: [], // IDK
        // touchSpotThreshold: // Default value
        // handleBuiltInTouches: true, // Default value
        fullHeightTouchLine: true,
        // touchCallback: // IDK
      ),
      showingTooltipIndicators: [],
      //
      gridData: FlGridData(),
      borderData: FlBorderData(),
      axisTitleData: FlAxisTitleData(),
      rangeAnnotations: RangeAnnotations(),
      minX: 9,
      maxX: 21,
      minY: 48,
      maxY: 55,
      clipData: FlClipData.none(),
      backgroundColor: Colors.black,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        rightTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(
          color: const Color(0xff37434d),
          width: 1,
        ),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
