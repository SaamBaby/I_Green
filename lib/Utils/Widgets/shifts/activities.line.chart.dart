import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceChart extends StatelessWidget {

  final List<FlSpot> spotData;
  final List<Color> gradientColors = [
    Color(0xFF54E597),
  ];


  AttendanceChart({this.spotData});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      mainData(),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xfff3f3f3),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xfff3f3f3),
            strokeWidth: 1
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 16,
          getTextStyles: (value) => TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: "Futura Book",
              letterSpacing: .8,
              height: 1,
              color: Colors.black.withOpacity(.4),
              fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return DateFormat('dd').format(DateTime.now().subtract
                  (const Duration(days: 7)));
              case 2:
                return DateFormat('dd  ').format(DateTime.now().subtract
                  (const Duration(days: 6)));
              case 3:
                return DateFormat('dd').format(DateTime.now().subtract
                  (const Duration(days: 5)));
              case 4:
                return DateFormat('dd').format(DateTime.now().subtract
                  (const Duration(days: 4)));
              case 5:
                return DateFormat('dd').format(DateTime.now().subtract
                  (const Duration(days: 3)));
              case 6:
                return DateFormat('dd').format(DateTime.now().subtract
                  (const Duration(days: 2)));
              case 7:
                return DateFormat('dd').format(DateTime.now().subtract
                  (const Duration(days: 1)));
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => TextStyle(
              fontWeight: FontWeight.w900,
              fontFamily: "Futura Book",
              letterSpacing: .8,
              height: 1,
              color: Colors.black.withOpacity(.4),
              fontSize: 9),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0 -';
              case 1:
                return '1hr -';
              case 2:
                return '2hr -';
              case 3:
                return '3hr -';
              case 4:
                return '4hr -';
              case 5:
                return '5hr -';
              case 6:
                return '6hr -';
              case 7:
                return '7hr -';
              case 8:
                return '8hr -';
              case 9:
                return '9hr -';
              case 10:
                return '10hr -';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true, 
          border: Border(
        left: BorderSide( //                   <--- left side
          color: Colors.black.withOpacity(.1),
          width: 1.0,
        ),
        bottom: BorderSide( //                    <--- top side
          color: Colors.black.withOpacity(.1),
          width: 1.0,
        ),
      )),
      minX: 0,
      maxX: 7,
      minY: 0,
      maxY: 11,
      lineBarsData: [
        LineChartBarData(
          spots:spotData ,
          isCurved: true,
          colors: gradientColors,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.1)).toList(),
          ),
        ),
      ],
    );
  }


}
