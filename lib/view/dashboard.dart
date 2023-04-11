import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:pockey/view/addGoal.dart';
import 'package:pockey/widget/tile.dart';

class DashBoard extends StatefulWidget {
  List<String> categories;
  DashBoard({super.key, required this.categories});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool press = false;
  int selectedMonthIndex = -1;
  TextEditingController _incomeMoneyController = new TextEditingController();
  String IncomeMoney = "10000";
  List<String> months = [
    "January",
    "Febuary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  void dispose() {
    // ignore: avoid_print
    print('Dispose used');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amber[100],
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 5, top: 10, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                //Name will be fetched from DB
                child: Text(
                  "Hello Anshyyy 👋",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Tile(
                      1,
                      50,
                      Icon(Icons.account_balance_wallet),
                      50,
                      Text(
                        '₹' + IncomeMoney,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ), () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.amber[100],
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter mystate) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                        child: Text("Add you Income",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold))),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text("Amount",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              child: TextField(
                                                controller:
                                                    _incomeMoneyController,
                                                style: TextStyle(
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintText: "Total Amount",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.black,
                                                            width: 2.0),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
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
                                              "  Enter this month Income or Pocket Money",
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                          ],
                                        ))
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    const Center(
                                        child: Text("Select Month",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w900))),
                                    Column(
                                      children: [
                                        Container(
                                          height: 60,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.only(right: 2),
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: months.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: NeuTextButton(
                                                      Text(
                                                        (selectedMonthIndex !=
                                                                index)
                                                            ? months[index]
                                                            : months[index] +
                                                                ' 📌',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w900),
                                                      ),
                                                      Colors
                                                          .primaries[index + 2],
                                                      50,
                                                      150,
                                                      Colors.black,
                                                      Colors.black,
                                                      1, () {
                                                    mystate(() {
                                                      selectedMonthIndex =
                                                          index;
                                                      print(selectedMonthIndex);
                                                    });
                                                  }),
                                                );
                                              }),
                                        ),
                                        SizedBox(height: 60),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            NeuTextButton(
                                                const Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Colors.grey,
                                                70,
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.3,
                                                Colors.black,
                                                Colors.black,
                                                1, () {
                                              Navigator.of(context).pop();
                                            }),
                                            const SizedBox(width: 10),
                                            NeuTextButton(
                                                const Text(
                                                  "Done",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Colors.blueAccent,
                                                70,
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.3,
                                                Colors.black,
                                                Colors.black,
                                                1, () {
                                              setState(() {
                                                IncomeMoney =
                                                    _incomeMoneyController.text;
                                              });
                                              Navigator.of(context).pop();
                                            })
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        });
                  },
                      Colors.blueAccent,
                      Text(
                        "Income  >",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Tile(
                      1,
                      50,
                      Icon(Icons.account_balance_wallet),
                      50,
                      Text("₹40,000",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      () {},
                      Colors.blueAccent,
                      Text(
                        "Expenses  >",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Tile(
                      1,
                      50,
                      Icon(Icons.account_balance_wallet),
                      50,
                      Text("₹30000",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      () {},
                      Colors.blueAccent,
                      Text(
                        "Balance  >",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Tile(
                      1,
                      50,
                      Icon(Icons.add_chart),
                      50,
                      Text("45%",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      () {},
                      Colors.amber,
                      Text(
                        "Analytics",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ))
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
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
                    color: Colors.green),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 8, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " Add a Goal",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      Neubrutalism.neuIconButton(
                          icon: Icon(Icons.plus_one),
                          buttonHeight: 50,
                          buttonWidth: 50,
                          borderWidth: 1,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddGoal(
                                      categories: widget.categories,
                                    )));
                          },
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          buttonColor: Colors.redAccent,
                          paddingData: const EdgeInsets.all(1))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
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
                    color: Colors.amber[50]),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Center(
                          child: Text(
                            "Recent Transactions",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Food",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Text(
                                "-₹4500",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 22),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Travel",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Text(
                                "-₹4500",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 22),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Loan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Text(
                                "-₹6500",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 22),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Grocery",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Text(
                                "-₹450",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 22),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Miscellaneous",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Text(
                                "-₹450",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 22),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
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
