import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pockey/widget/constantRandomColor.dart';

class PieChartt extends StatefulWidget {
  @override
  _PieCharttState createState() => _PieCharttState();
}

class _PieCharttState extends State<PieChartt> {
  int touchedIndex = -1;
  Map<String, int> percentageValueOfPieChart = {
    // this data will be fetched from Db
    "Movie": 35,
    "Food": 20,
    "Grocery": 20,
    "Drinks": 25
  };
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < percentageValueOfPieChart.length; i++)
              _buildLegend(
                  percentageValueOfPieChart.keys.elementAt(i),
                  percentageValueOfPieChart.values.elementAt(i).toString() +
                      '%',
                  randomColors[i]),
          ],
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
                for (int i = 0; i < percentageValueOfPieChart.length; i++)
                  PieChartSectionData(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                    value: percentageValueOfPieChart.values
                        .elementAt(i)
                        .toDouble(),
                    color: randomColors[i],
                    title: percentageValueOfPieChart.values
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
                // PieChartSectionData(
                //   borderSide: BorderSide(color: Colors.black, width: 1),
                //   value: 35,
                //   color: Colors.green,
                //   title: '35%',
                //   radius: touchedIndex == 1 ? 70 : 60,
                //   titleStyle: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: touchedIndex == 1 ? Colors.white : Colors.black,
                //   ),
                //   titlePositionPercentageOffset: 0.55,
                // ),
                // PieChartSectionData(
                //   borderSide: BorderSide(color: Colors.black, width: 1),
                //   value: 20,
                //   color: Colors.orange,
                //   title: '20%',
                //   radius: touchedIndex == 2 ? 70 : 60,
                //   titleStyle: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: touchedIndex == 2 ? Colors.white : Colors.black,
                //   ),
                //   titlePositionPercentageOffset: 0.55,
                // ),
                // PieChartSectionData(
                //   borderSide: BorderSide(color: Colors.black, width: 1),
                //   value: 20,
                //   color: Colors.purple,
                //   title: '20%',
                //   radius: touchedIndex == 3 ? 70 : 60,
                //   titleStyle: TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: touchedIndex == 3 ? Colors.white : Colors.black,
                //   ),
                //   titlePositionPercentageOffset: 0.55,
                // ),
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
