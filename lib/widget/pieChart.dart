import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pockey/widget/constantRandomColor.dart';
import 'package:intl/intl.dart';

class PieChartt extends StatefulWidget {
  bool isWeek;
  Map<String, int> percentageValueOfPieChart;

  PieChartt({required this.isWeek, required this.percentageValueOfPieChart});
  @override
  _PieCharttState createState() => _PieCharttState();
}

class _PieCharttState extends State<PieChartt> {
  int touchedIndex = -1;
  int currentWeek = (((DateTime.now().day - 1) / 7) + 1).ceil();
  String month = DateFormat.yMMMM().format(DateTime.now());
  String year = DateFormat.yMMMM().format(DateTime.now());

  String getNumberSuffix(int number) {
    if (number % 10 == 1 && number % 100 != 11) {
      return 'st';
    } else if (number % 10 == 2 && number % 100 != 12) {
      return 'nd';
    } else if (number % 10 == 3 && number % 100 != 13) {
      return 'rd';
    } else {
      return 'th';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: widget.isWeek
                      ? Text(
                          currentWeek.toString() +
                              getNumberSuffix(currentWeek) +
                              " Week",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        )
                      : Text(
                          month,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        )),
              Divider(
                color: Colors.black,
                thickness: 1,
                indent: 0,
                endIndent: 40,
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < widget.percentageValueOfPieChart.length; i++)
                _buildLegend(
                    widget.percentageValueOfPieChart.keys.elementAt(i),
                    widget.percentageValueOfPieChart.values
                            .elementAt(i)
                            .toString() +
                        '%',
                    randomColors[i]),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 0.9,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.black, width: 2),
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: [
                for (int i = 0;
                    i < widget.percentageValueOfPieChart.length;
                    i++)
                  PieChartSectionData(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    value: widget.percentageValueOfPieChart.values
                        .elementAt(i)
                        .toDouble(),
                    color: randomColors[i],
                    title: widget.percentageValueOfPieChart.values
                            .elementAt(i)
                            .toString() +
                        '%',
                    radius: touchedIndex == i ? 70 : 60,
                    titleStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: touchedIndex == i ? Colors.white : Colors.black,
                    ),
                    titlePositionPercentageOffset: 0.55,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLegend(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(width: 20, height: 20, color: color),
          SizedBox(width: 8),
          Text(label),
          SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }
}
