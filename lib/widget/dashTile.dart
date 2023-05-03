import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:pockey/widget/addButtonWidget.dart';
import 'package:pockey/widget/tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class DashTile extends StatefulWidget {
  final Function callback;

  const DashTile({super.key, required this.callback});

  @override
  State<DashTile> createState() => _DashTileState();
}

class _DashTileState extends State<DashTile> {
  bool press = false;
  int selectedMonthIndex = -1;
  bool _isloading = true;
  TextEditingController _incomeMoneyController = new TextEditingController();
  TextEditingController _expenseController = new TextEditingController();
  late String incomeMoney = "0";
  late String income = incomeMoney;
  late String expense = "0";
  String balance = "0";

  // Future<void> getIncome() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   print('in function');
  //   setState(() async {
  //     await prefs.setString('incomeMoney', _incomeMoneyController.text);
  //     print("saved income");
  //     income = await prefs.getString('incomeMoney') ?? "0";
  //     print(income);
  //   });
  // }

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
    return Container(
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
                                                  borderSide: const BorderSide(
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
                                                              FontWeight.w900),
                                                    ),
                                                    Colors.primaries[index + 2],
                                                    50,
                                                    150,
                                                    Colors.black,
                                                    Colors.black,
                                                    1, () {
                                                  mystate(() {
                                                    selectedMonthIndex = index;
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
                                                    fontWeight: FontWeight.bold,
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
                                                    fontWeight: FontWeight.bold,
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
    ));
  }
}
