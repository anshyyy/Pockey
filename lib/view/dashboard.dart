import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:pockey/view/addGoal.dart';
import 'package:pockey/widget/dashTile.dart';
import 'package:pockey/widget/tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/colors.dart';
import '../data/expenseData.dart';
import '../widget/addButtonWidget.dart';
import '../widget/recentExpenseTile.dart';

class DashBoard extends StatefulWidget {
  List<String> categories;
  DashBoard({super.key, required this.categories});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with RouteAware {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  bool press = false;
  int selectedMonthIndex = -1;
  bool _isloading = true;
  TextEditingController _incomeMoneyController = new TextEditingController();
  TextEditingController _expenseController = new TextEditingController();
  late String incomeMoney = "0";
  late String income = incomeMoney;
  late String expense = "0";
  String balance = "0";
  //List<Map<String, dynamic>>recentExpense;
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

  void loadIncome() async {
    print("i was called");
    final prefs = await SharedPreferences.getInstance();
    incomeMoney = await prefs.getString('incomeMoney') ?? "0";
    String exp = await prefs.getString('expense') ?? '0';
    int remaining = (int.parse(incomeMoney) - int.parse(exp));
    print("here is the balance");
    print(remaining);
    String bal = "0";
    if (remaining >= 0) {
      bal = remaining.toString();
    }
    if (remaining < 0) {
      bal = "0";
    }
    print(bal);
    setState(() async {
      income = incomeMoney;
      expense = exp;
      balance = bal;
    });
  }

  void resetIncomeOnDay1ofmonths() async {
    final prefs = await SharedPreferences.getInstance();
    var date = DateTime.now();
    var newDate =
        DateTime(date.year, date.month - 1, date.day).toString().split("")[0];
    int today = int.parse(newDate);
    print("sadsadas");
    print(newDate);
    bool flag = true;
    if (today == 1) {
      await prefs.setString('incomeMoney', '0');
      await prefs.setString('expense', "0");
      setState(() {
        income = "0";
        expense = '0';
      });
    }
    if (today != 1) {
      String money = _incomeMoneyController.text;
      String? oldIncome = await prefs.getString('incomeMoney');
      String newIncome = (int.parse(money) + int.parse(oldIncome!)).toString();
      await prefs.setString('incomeMoney', newIncome);
      setState(() {
        income = newIncome;
      });
    }
  }

  // void saveExpensesAndDeductitonDay1() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String recentExpense = _expenseController.text;
  //   String? oldExpense = await prefs.getString('expense');
  //   String newExpense =
  //       (int.parse(recentExpense) + int.parse(oldExpense!)).toString();
  //   await prefs.setString('expense', newExpense);
  //   setState(() {
  //     expense = newExpense;
  //   });
  // }

  void addExpense(String exp) async {
    final prefs = await SharedPreferences.getInstance();
    String recentExpense = exp;
    String? oldExpense = await prefs.getString('expense') ?? "0";
    print(recentExpense);
    print(oldExpense);
    String newExpense =
        (int.parse(recentExpense) + int.parse(oldExpense)).toString();
    await prefs.setString('expense', newExpense);
    setState(() {
      expense = newExpense;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadIncome();
    resetIncomeOnDay1ofmonths();
    //saveExpensesAndDeductitonDay1();
    _isloading = true;
    print(_isloading);
    //income = incomeMoney as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kwhite,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Center(
          child: Text(
            "+",
            style: TextStyle(fontSize: 35),
          ),
        ),
        onPressed: () async {
          // Add your onPressed code here!
          final String value = await Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => AddButton())));
          addExpense(value);
          loadIncome();
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                              !_isloading
                                  ? Shimmer.fromColors(
                                      child: SizedBox(height: 20, width: 40),
                                      baseColor: Colors.grey,
                                      highlightColor: Colors.white)
                                  : Shimmer.fromColors(
                                      period: Duration(seconds: 5),
                                      baseColor: Colors.white,
                                      highlightColor: Colors.red,
                                      child: Text(
                                        '₹' + income,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ), () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: kwhite,
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter mystate) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Center(
                                                child: Text("Add you Income",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Text("Amount",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
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
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          hintText:
                                                              "Total Amount",
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
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  1.0),
                                                            ),
                                                            borderSide: BorderSide(
                                                                style:
                                                                    BorderStyle
                                                                        .none,
                                                                width: 5,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      "  Enter this month Income or Pocket Money",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black54),
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
                                                        fontWeight:
                                                            FontWeight.w900))),
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
                                                      itemCount: months.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: NeuTextButton(
                                                              Text(
                                                                (selectedMonthIndex !=
                                                                        index)
                                                                    ? months[
                                                                        index]
                                                                    : months[
                                                                            index] +
                                                                        ' 📌',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w900),
                                                              ),
                                                              Colors.primaries[
                                                                  index + 2],
                                                              50,
                                                              150,
                                                              Colors.black,
                                                              Colors.black,
                                                              1, () {
                                                            mystate(() {
                                                              selectedMonthIndex =
                                                                  index;
                                                              print(
                                                                  selectedMonthIndex);
                                                            });
                                                          }),
                                                        );
                                                      }),
                                                ),
                                                SizedBox(height: 60),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    NeuTextButton(
                                                        const Text(
                                                          "Cancel",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                      Navigator.of(context)
                                                          .pop();
                                                    }),
                                                    const SizedBox(width: 10),
                                                    NeuTextButton(
                                                        const Text(
                                                          "Done",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                                      // getIncome();
                                                      resetIncomeOnDay1ofmonths();
                                                      loadIncome();
                                                      Navigator.of(context)
                                                          .pop();
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
                              Shimmer.fromColors(
                                loop: 2,
                                baseColor: Colors.white,
                                highlightColor: Colors.grey,
                                child: Text("₹" + expense,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
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
                              Shimmer.fromColors(
                                loop: 2,
                                baseColor: Colors.white,
                                highlightColor: Colors.black,
                                child: Text("₹" + balance,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
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
                              Shimmer.fromColors(
                                loop: 2,
                                baseColor: Colors.black,
                                highlightColor: Colors.grey,
                                child: Text("45%",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
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
                    ]),
              )),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 65,
                  padding: const EdgeInsets.only(left: 10, right: 10),
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
                    padding:
                        const EdgeInsets.only(left: 5, right: 8, bottom: 2),
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
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Recent Transactions",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: expenseData.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: Card(
                                  margin: const EdgeInsets.all(20.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
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
                                          color: Colors.white),
                                      child: RecentExpenseWidget(
                                        date: expenseData.keys.elementAt(
                                            expenseData.length - index - 1),
                                        exp: expenseData.values.elementAt(
                                            expenseData.length - index - 1),
                                      )),
                                ),
                              ),
                              Positioned(
                                top: 0.0,
                                bottom: 0.0,
                                left: 35.0,
                                child: new Container(
                                  height: double.infinity,
                                  width: 1.0,
                                  color: Colors.blue,
                                ),
                              ),
                              Positioned(
                                top: 70.0,
                                left: 26.0,
                                child: Container(
                                  height: 20.0,
                                  width: 20.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(5.0),
                                    height: 10.0,
                                    width: 10.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                  ),
                                ),
                              )
                            ],
                          );
                          // return RecentExpenseWidget(
                          //   date: expenseData.keys.elementAt(index),
                          //   exp: expenseData.values.elementAt(index),
                          // );
                        })
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
/*

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




*/