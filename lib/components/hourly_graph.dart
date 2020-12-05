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
      child: LineChart(
        weatherData(),
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
          // colorStops: null, // Not used
          // gradientFrom: 0-1 // Not used
          // gradientTo: 0-1 // Not used
          barWidth: 5.0,
          isCurved: true,
          // curveSmoothness: 0.0 // Default value is perfect
          // preventCurveOverShooting: false // Default value
          // preventCurveOvershootingThreshold: 10.0, // Not used
          // isStrokeCapRound: false, // Not used
          // belowBarData: , // Not used
          // aboveBarData: , // Not used
          dotData: FlDotData(
            show: false,
            // checkToShowDot: null // Not used
            // getDotPainter: null // Not used
          ),
          // showingIndicators: [],// Not used
          // dashArray: [5, 1], // Maybe ?
          isStepLineChart: false,
          // lineChartStepData: isStepLineChart must be true to used // Not used
        ),
      ],
      betweenBarsData: [],
      titlesData: FlTitlesData(),
      extraLinesData: ExtraLinesData(),
      lineTouchData: LineTouchData(),
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
      backgroundColor: Colors.greenAccent,
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
