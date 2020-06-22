import 'package:activityapp/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyChart extends StatelessWidget {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: BarChart(
        BarChartData(
          barGroups: getBarGroups(),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
              showTitles: true,
              getTitles: getWeek,
              textStyle: TextStyle(
                color: Color(0xFF7589A2),
                fontWeight: FontWeight.w200,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

getBarGroups() {
  List<double> barChartDatas = [6, 10, 8, 7, 15, 7, 9];
  List<BarChartGroupData> barChartGroups = [];

  barChartDatas.asMap().forEach(
        (key, value) => barChartGroups.add(
          BarChartGroupData(
            x: key,
            barRods: [
              BarChartRodData(
                y: value,
                //color: key == 2 ? kPrimaryColor : kInactiveChartColor,
                color: key == 4 ? Colors.purple : Colors.red.shade700,
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  y: 18,
                  color: kInactiveChartColor,
                ),
                width: 15,
              ),
            ],
          ),
        ),
      );
  return barChartGroups;
}

String getWeek(double value) {
  switch (value.toInt()) {
    case 0:
      return 'Sun';
    case 1:
      return 'Mon';
    case 2:
      return 'Tue';
    case 3:
      return 'Wed';
    case 4:
      return 'Thu';
    case 5:
      return 'Fri';
    case 6:
      return 'Sat';
  }
}
