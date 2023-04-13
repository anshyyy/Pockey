import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:pockey/widget/barData.dart';
import 'package:pockey/widget/constantRandomColor.dart';

class MonthlyBarGraph extends StatefulWidget {
  const MonthlyBarGraph({super.key});

  @override
  State<MonthlyBarGraph> createState() => _MonthlyBarGraphState();
}

class _MonthlyBarGraphState extends State<MonthlyBarGraph> {
  List<double> monthlyExpense = [
    100,
    200,
    450,
    570,
    1000,
    0,
    300,
    50,
    100,
    120,
    2000,
    135
  ];
  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(monthlyExpense: monthlyExpense);
    myBarData.initializeBarData();
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: AspectRatio(
          aspectRatio: 2.3,
          child: BarChart(
            BarChartData(
              minY: 0,
              maxY: monthlyExpense.reduce(max) + 500,
              titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true, getTitlesWidget: getBottomTitles))),
              barGroups: myBarData.barData
                  .map((data) => BarChartGroupData(x: data.x, barRods: [
                        BarChartRodData(
                            toY: data.y,
                            width: 10,
                            borderRadius: BorderRadius.circular(1),
                            gradient: LinearGradient(
                              colors: [Colors.green, Colors.blue],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                      ]))
                  .toList(),
            ),
          )),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11);
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text("Jan", style: style);
        break;
      case 2:
        text = const Text("Feb", style: style);
        break;
      case 3:
        text = const Text("Mar", style: style);
        break;
      case 4:
        text = const Text("Apr", style: style);
        break;
      case 5:
        text = const Text("May", style: style);
        break;
      case 6:
        text = const Text("June", style: style);
        break;
      case 7:
        text = const Text("July", style: style);
        break;
      case 8:
        text = const Text("Aug", style: style);
        break;
      case 9:
        text = const Text("Sep", style: style);
        break;
      case 10:
        text = const Text("Oct", style: style);
        break;
      case 11:
        text = const Text("Nov", style: style);
        break;
      case 12:
        text = const Text("Dec", style: style);
        break;
      default:
        text = const Text("", style: style);
        break;
    }
    return SideTitleWidget(child: text, axisSide: meta.axisSide);
  }
}
