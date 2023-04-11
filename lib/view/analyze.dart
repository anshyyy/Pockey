import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widget/dashTile.dart';

class Analyze extends StatefulWidget {
  const Analyze({super.key});

  @override
  State<Analyze> createState() => _AnalyzeState();
}

class _AnalyzeState extends State<Analyze> with TickerProviderStateMixin {
  int touchedIndex = 0;
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: DashTile(),
            ),
            const SizedBox(height: 10),
            Text("  DashBoard",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 0,
                                offset: Offset(4, 4),
                              ),
                            ],
                            color: Colors.blue,
                          ),
                          controller: _tabController,
                          isScrollable: true,
                          unselectedLabelColor: Colors.grey,
                          labelColor: Colors.black,
                          tabs: [
                            const Text("Weekly"),
                            const Text("Monthly"),
                            const Text("Yearly"),
                          ]),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      height: 270,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          AspectRatio(
                            aspectRatio: 2,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3,
                              color: Colors.red,
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback:
                                        (FlTouchEvent event, pieTouchResponse) {
                                      setState(() {
                                        if (!event
                                                .isInterestedForInteractions ||
                                            pieTouchResponse == null ||
                                            pieTouchResponse.touchedSection ==
                                                null) {
                                          touchedIndex = -1;
                                          return;
                                        }
                                        touchedIndex = pieTouchResponse
                                            .touchedSection!
                                            .touchedSectionIndex;
                                      });
                                    },
                                  ),
                                  borderData: FlBorderData(
                                      show: false,
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
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
                                        color: touchedIndex == 0
                                            ? Colors.white
                                            : Colors.black,
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
                                        color: touchedIndex == 1
                                            ? Colors.white
                                            : Colors.black,
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
                                        color: touchedIndex == 2
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      titlePositionPercentageOffset: 0.55,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Text("HI1"),
                          const Text("HI2"),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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
