import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddButtom extends StatefulWidget {
  TextEditingController expenseController;
  AddButtom({super.key, required this.expenseController});

  @override
  State<AddButtom> createState() => _AddButtomState();
}

class _AddButtomState extends State<AddButtom> {
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
    final prefs = await SharedPreferences.getInstance();
    var income = await prefs.getString('incomeMoney') ?? "0";
    int leftMoney = int.parse(income) - expense;
    await prefs.setString("incomeMoney", leftMoney.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Neubrutalism.neuIconButton(
          icon: Icon(Icons.add),
          buttonHeight: 60,
          buttonWidth: 60,
          borderWidth: 1,
          onPressed: () {
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
                                                      widget.expenseController,
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
                                                              color:
                                                                  Colors.black,
                                                              width: 2.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(1.0),
                                                      ),
                                                      borderSide: BorderSide(
                                                          style:
                                                              BorderStyle.none,
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
                                                              color:
                                                                  Colors.black,
                                                              width: 2.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(1.0),
                                                      ),
                                                      borderSide: BorderSide(
                                                          style:
                                                              BorderStyle.none,
                                                          width: 5,
                                                          color: Colors.black),
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
                                            padding: EdgeInsets.only(right: 2),
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount: categories.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: NeuTextButton(
                                                        Text(
                                                          categories[index],
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.white,
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
                                                    fontWeight: FontWeight.bold,
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
                                                          bottom: MediaQuery.of(
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
                                                                    height: 20,
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
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                TextField(
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
                                                                          const SizedBox(
                                                                              height: 5),
                                                                          Text(
                                                                            "Enter the Name of the new Category",
                                                                            style:
                                                                                TextStyle(color: Colors.black54),
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
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 20),
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
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 20),
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
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Colors.blue,
                                            70,
                                            MediaQuery.of(context).size.width,
                                            Colors.black,
                                            Colors.black,
                                            1, () {
                                          deductMonetFromIncome(int.parse(
                                              widget.expenseController.text));
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
                }).whenComplete(() {});
          },
          borderRadius: BorderRadius.circular(70),
          buttonColor: Colors.blue,
          paddingData: const EdgeInsets.all(10)),
    );
  }
}
