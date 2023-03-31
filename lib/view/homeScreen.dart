import 'package:flutter/material.dart';
import 'package:pockey/view/analyze.dart';
import 'package:pockey/view/dashboard.dart';
import 'package:pockey/view/profile.dart';
import 'package:pockey/view/search.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool press = false;
  int currentTab = 0;
  final List<String> screens = [
    "Home",
    "Analyze",
    "Search",
    "Profile",
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Analyze();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: Container(
              color: Colors.black,
              height: 3,
            ),
          ),
          backgroundColor: Colors.amber[50],
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
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: Neubrutalism.neuIconButton(
          icon: Icon(Icons.add),
          buttonHeight: 60,
          buttonWidth: 60,
          borderWidth: 1,
          onPressed: () {
            setState(() {
              if (press) {
                press = false;
              } else if (!press) {
                press = true;
              }
            });
          },
          shadowBlurRadius: press == false ? 0 : 3,
          borderRadius: BorderRadius.circular(70),
          buttonColor: Colors.blue,
          paddingData: const EdgeInsets.all(10)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber[50],
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = DashBoard();
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
                                color: currentTab == 0
                                    ? Colors.black
                                    : Colors.grey))
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
                                color: currentTab == 1
                                    ? Colors.black
                                    : Colors.grey))
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                color: currentTab == 2
                                    ? Colors.black
                                    : Colors.grey))
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
                                color: currentTab == 3
                                    ? Colors.black
                                    : Colors.grey))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
