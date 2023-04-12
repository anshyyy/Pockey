import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:pockey/widget/barData.dart';

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
              barGroups: myBarData.barData
                  .map((data) => BarChartGroupData(x: data.x, barRods: [
                        BarChartRodData(toY: data.y),
                      ]))
                  .toList(),
            ),
          )),
    );
  }
}
