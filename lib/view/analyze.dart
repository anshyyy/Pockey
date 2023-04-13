import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pockey/view/search.dart';
import 'package:pockey/widget/MonthlyBarGraph.dart';
import 'package:pockey/widget/pieChart.dart';
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
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
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
                          PieChartt(
                            percentageValueOfPieChart: {
                              "Movie": 35,
                              "Food": 20,
                              "Grocery": 20,
                              "Drinks": 25
                            },
                            isWeek: true,
                          ),
                          PieChartt(
                            percentageValueOfPieChart: {
                              "Movie": 10,
                              "Food": 5,
                              "Grocery": 20,
                              "Drinks": 5,
                              "Shopping": 60
                            },
                            isWeek: false,
                          ),
                          MonthlyBarGraph(),
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
