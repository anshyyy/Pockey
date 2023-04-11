import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 2,
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
                PieChartSectionData(
                  value: 25,
                  color: Colors.blue,
                  title: '25%',
                  radius: touchedIndex == 0 ? 70 : 60,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: touchedIndex == 0 ? Colors.white : Colors.black,
                  ),
                  titlePositionPercentageOffset: 0.55,
                ),
                PieChartSectionData(
                  value: 35,
                  color: Colors.green,
                  title: '35%',
                  radius: touchedIndex == 1 ? 70 : 60,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: touchedIndex == 1 ? Colors.white : Colors.black,
                  ),
                  titlePositionPercentageOffset: 0.55,
                ),
                PieChartSectionData(
                  value: 40,
                  color: Colors.orange,
                  title: '40%',
                  radius: touchedIndex == 2 ? 70 : 60,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: touchedIndex == 2 ? Colors.white : Colors.black,
                  ),
                  titlePositionPercentageOffset: 0.55,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLegend('Blue', '25%'),
            _buildLegend('Green', '35%'),
            _buildLegend('Orange', '40%'),
          ],
        ),
      ],
    );
  }

  Widget _buildLegend(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            color: label == 'Blue'
                ? Colors.blue
                : label == 'Green'
                    ? Colors.green
                    : Colors.orange,
          ),
          SizedBox(width: 8),
          Text(label),
          SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }
}
