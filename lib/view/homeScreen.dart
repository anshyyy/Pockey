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
              showModalBottomSheet(
                  backgroundColor: Colors.amber[100],
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text("Add the Expense",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text(
                                      "Amount",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          child: TextField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: "Expense",
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 2.0),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(1.0),
                                                ),
                                                borderSide: BorderSide(
                                                    style: BorderStyle.none,
                                                    width: 5,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                            "  Enter the amount that you have spent",
                                            style: TextStyle(
                                                color: Colors.black54))
                                      ],
                                    ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Description",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 50,
                                          child: TextField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              hintText: "Description",
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.black,
                                                    width: 2.0),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(1.0),
                                                ),
                                                borderSide: BorderSide(
                                                    style: BorderStyle.none,
                                                    width: 5,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          "  Some description about your expense",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                                Text(
                                  "Categories :",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  children: [
                                    ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: 3,
                                        itemBuilder: (context, index) {
                                          return NeuTextButton(
                                              Text("Hello"),
                                              Colors.red,
                                              50,
                                              100,
                                              Colors.black,
                                              Colors.black,
                                              1,
                                              () {});
                                        }),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                  });
              press = false;
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
