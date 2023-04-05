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
                        "₹1,00,000",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      () {},
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
