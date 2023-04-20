import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:pockey/main.dart';
import 'package:pockey/session_manager/session_manager.dart';
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
  void didPush() {
    setState(() {});
    print('HomePage: Called didPush');
    super.didPush();
  }

  @override
  void didPop() {
    setState(() {});
    print('HomePage: Called didPop');
    super.didPop();
  }

  @override
  void didPopNext() {
    setState(() {});
    print('HomePage: Called didPopNext');
    super.didPopNext();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });

    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void didPushNext() {
    setState(() {});
    print("did push next");
    super.didPushNext();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(builder: (context, setState) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                                height: 500,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                    controller:
                                                        _expenseController,
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      hintText: "Expense",
                                                      hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                      enabledBorder:
                                                          const OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 2.0),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(1.0),
                                                        ),
                                                        borderSide: BorderSide(
                                                            style: BorderStyle
                                                                .none,
                                                            width: 5,
                                                            color:
                                                                Colors.black),
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
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      hintText: "Description",
                                                      hintStyle: TextStyle(
                                                        color: Colors.grey,
                                                      ),
                                                      enabledBorder:
                                                          const OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black,
                                                                width: 2.0),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(1.0),
                                                        ),
                                                        borderSide: BorderSide(
                                                            style: BorderStyle
                                                                .none,
                                                            width: 5,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  "  Some description about your expense",
                                                  style: TextStyle(
                                                      color: Colors.black54),
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
                                            Container(
                                              height: 60,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding:
                                                  EdgeInsets.only(right: 2),
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemCount: categories.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: NeuTextButton(
                                                          Text(
                                                            categories[index],
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900),
                                                          ),
                                                          color[index %
                                                              color.length],
                                                          50,
                                                          100,
                                                          Colors.black,
                                                          Colors.black,
                                                          1,
                                                          () {}),
                                                    );
                                                  }),
                                            ),
                                            const SizedBox(width: 5)
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              child: Flexible(
                                                child: Text(
                                                  "Want to add a new Category?",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: NeuTextButton(
                                                  Text("Add a new Category!"),
                                                  Colors.amberAccent,
                                                  60,
                                                  200,
                                                  Colors.black,
                                                  Colors.black,
                                                  1, () {
                                                showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.amber[100],
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Padding(
                                                        padding: EdgeInsets.only(
                                                            bottom:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets
                                                                    .bottom),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            SizedBox(
                                                              height: 300,
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(5),
                                                                child: Column(
                                                                  children: [
                                                                    Center(
                                                                        child: Text(
                                                                            "Add a New Category",
                                                                            style: TextStyle(
                                                                                fontSize: 20,
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold))),
                                                                    const SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            "Name",
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold)),
                                                                        const SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Expanded(
                                                                            child:
                                                                                Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 50,
                                                                              child: TextField(
                                                                                style: TextStyle(color: Colors.black),
                                                                                decoration: InputDecoration(
                                                                                  filled: true,
                                                                                  fillColor: Colors.white,
                                                                                  hintText: "Category Name",
                                                                                  hintStyle: TextStyle(
                                                                                    color: Colors.grey,
                                                                                  ),
                                                                                  enabledBorder: const OutlineInputBorder(
                                                                                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                                                                  ),
                                                                                  border: OutlineInputBorder(
                                                                                    borderRadius: BorderRadius.all(
                                                                                      Radius.circular(1.0),
                                                                                    ),
                                                                                    borderSide: BorderSide(style: BorderStyle.none, width: 5, color: Colors.black),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            const SizedBox(height: 5),
                                                                            Text(
                                                                              "Enter the Name of the new Category",
                                                                              style: TextStyle(color: Colors.black54),
                                                                            ),
                                                                          ],
                                                                        ))
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            60),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        NeuTextButton(
                                                                            const Text(
                                                                              "Cancel",
                                                                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                                                                            ),
                                                                            Colors
                                                                                .grey,
                                                                            70,
                                                                            MediaQuery.of(context).size.width /
                                                                                2.3,
                                                                            Colors
                                                                                .black,
                                                                            Colors
                                                                                .black,
                                                                            1,
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        }),
                                                                        const SizedBox(
                                                                            width:
                                                                                10),
                                                                        NeuTextButton(
                                                                            const Text(
                                                                              "Create",
                                                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                                                            ),
                                                                            Colors
                                                                                .blueAccent,
                                                                            70,
                                                                            MediaQuery.of(context).size.width /
                                                                                2.3,
                                                                            Colors
                                                                                .black,
                                                                            Colors
                                                                                .black,
                                                                            1,
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        })
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              }),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 60,
                                        ),
                                        Container(
                                          child: NeuTextButton(
                                              Text(
                                                "Done",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Colors.blue,
                                              70,
                                              MediaQuery.of(context).size.width,
                                              Colors.black,
                                              Colors.black,
                                              1, () {
                                            deductMonetFromIncome(int.parse(
                                                _expenseController.text));
                                            DashTile().createState();
                                            Navigator.of(context).pop();
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      );
                    });
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
        color: Colors.amber[100],
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
