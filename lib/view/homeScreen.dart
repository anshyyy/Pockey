import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:pockey/main.dart';
import 'package:pockey/session_manager/session_manager.dart';
import 'package:pockey/view/addButtonWidget.dart';
import 'package:pockey/view/analyze.dart';
import 'package:pockey/view/dashboard.dart';
import 'package:pockey/view/profile.dart';
import 'package:pockey/view/search.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/dashTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, RouteAware {
  late AnimationController _controller;
  TextEditingController _expenseController = TextEditingController();
  bool press = false;
  int currentTab = 0;
  final List<String> screens = [
    "Home",
    "Analyze",
    "Search",
    "Profile",
  ];
  final List<Color> color = [
    Colors.red,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.yellow
  ];
  final List<String> categories = [
    "Food",
    "Movie",
    "Eating out",
    "Loan",
    "Shopping",
    "groceries"
  ];

  void deductMonetFromIncome(int expense) async {
    var income = await SessionManager().getAmountData ?? '888';
    int leftMoney = int.parse(income) - expense;
    await SessionManager().updateAmountData(leftMoney.toString());
    setState(() {
      income = leftMoney.toString(); // bug
    });
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Analyze(); // here a bug

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: Container(
              color: Colors.black,
              height: 3,
            ),
          ),
          backgroundColor: Colors.amber[100],
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.dehaze),
            color: Colors.black87,
            tooltip: "Settings",
          ),
          title: Text(
            screens[currentTab],
            style: TextStyle(color: Colors.black87),
          ),
          actions: [
            IconButton(
              color: Colors.black87,
              onPressed: () {},
              icon: Icon(Icons.notifications),
              tooltip: "Open Notifications",
            )
          ]),
      floatingActionButton: AddButtom(expenseController: _expenseController),
      body: PageStorage(bucket: bucket, child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber[100],
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = DashBoard(
                      categories: categories,
                    );
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: currentTab == 0 ? Colors.black : Colors.grey,
                    ),
                    Text("Home",
                        style: TextStyle(
                            color:
                                currentTab == 0 ? Colors.black : Colors.grey))
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = Analyze();
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.analytics,
                      color: currentTab == 1 ? Colors.black : Colors.grey,
                    ),
                    Text("Analyze",
                        style: TextStyle(
                            color:
                                currentTab == 1 ? Colors.black : Colors.grey))
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = Search();
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      color: currentTab == 2 ? Colors.black : Colors.grey,
                    ),
                    Text("Search",
                        style: TextStyle(
                            color:
                                currentTab == 2 ? Colors.black : Colors.grey))
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = Profile();
                    currentTab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: currentTab == 3 ? Colors.black : Colors.grey,
                    ),
                    Text("Profile",
                        style: TextStyle(
                            color:
                                currentTab == 3 ? Colors.black : Colors.grey))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
