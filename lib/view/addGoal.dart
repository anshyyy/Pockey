import "package:circular_motion/circular_motion.dart";
import "package:flutter/material.dart";
import "package:neubrutalism_ui/neubrutalism_ui.dart";
import 'dart:math';

import "../constants/colors.dart";

class AddGoal extends StatefulWidget {
  List<String> categories;
  AddGoal({super.key, required this.categories});

  @override
  State<AddGoal> createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  final List<Color> color = [
    Colors.red,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.yellow
  ];

  final List<String> days = ["7", "30", "60", "90", "120", "150"];
  final List<bool> selected = [false, false, false, false, false, false];

  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kwhite,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: kwhite,
          title: const Text(
            "Add Goal",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Goal Name",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Goal Name",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0),
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
                          "  Enter the name of your Goal",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Goal Amount",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Amount",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0),
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
                          " Amount that you want to add in goal",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Categories :",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(right: 2),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: widget.categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: NeuTextButton(
                                  Text(
                                    widget.categories[index],
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  color[index % color.length],
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Notes",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              1.1, // <-- TextField width
                          height: 100,
                          child: const TextField(
                            maxLines: null,
                            expands: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Example : This month saving",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0),
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
                          "    Additional Notes",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ))
                  ],
                ),
                Center(
                  child: SizedBox(
                    width: 370,
                    height: 250,
                    child: SafeArea(
                      // Here's is the magic.
                      child: CircularMotion(
                        behavior: HitTestBehavior.translucent,
                        centerWidget: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.black, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 0,
                                offset: Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Center(
                              child: Text(
                            "Days",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          )),
                        ),
                        children: [
                          InkWell(
                            onTap: () {
                              print(0);
                              setState(() {
                                if (selected[0])
                                  selected[0] = false;
                                else
                                  selected[0] = true;
                                for (int i = 0; i < days.length; i++) {
                                  if (i != 0) {
                                    selected[i] = false;
                                  }
                                }
                              });
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.primaries[0],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  (!selected[0]) ? days[0] : "🔒" + days[0],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                print(selected[1]);
                                if (selected[1])
                                  selected[1] = false;
                                else
                                  selected[1] = true;
                                for (int i = 0; i < days.length; i++) {
                                  if (i != 1) {
                                    selected[i] = false;
                                  }
                                }
                              });
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.primaries[2],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  (!selected[1]) ? days[1] : "🔒" + days[1],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print(2);
                              setState(() {
                                print(selected[2]);
                                if (selected[2])
                                  selected[2] = false;
                                else
                                  selected[2] = true;
                                for (int i = 0; i < days.length; i++) {
                                  if (i != 2) {
                                    selected[i] = false;
                                  }
                                }
                              });
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.primaries[4],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  (!selected[2]) ? days[2] : "🔒" + days[2],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print(3);
                              setState(() {
                                print(selected[3]);
                                if (selected[3])
                                  selected[3] = false;
                                else
                                  selected[3] = true;
                                for (int i = 0; i < days.length; i++) {
                                  if (i != 3) {
                                    selected[i] = false;
                                  }
                                }
                              });
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.primaries[6],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  (!selected[3]) ? days[3] : "🔒" + days[3],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                print(selected[4]);
                                if (selected[4])
                                  selected[4] = false;
                                else
                                  selected[4] = true;
                                for (int i = 0; i < days.length; i++) {
                                  if (i != 4) {
                                    selected[i] = false;
                                  }
                                }
                              });
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.primaries[8],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  (!selected[4]) ? days[4] : "🔒" + days[4],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                print(selected[5]);
                                if (selected[5])
                                  selected[5] = false;
                                else
                                  selected[5] = true;
                                for (int i = 0; i < days.length; i++) {
                                  if (i != 5) {
                                    selected[i] = false;
                                  }
                                }
                              });
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.primaries[10],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  (!selected[5]) ? days[5] : "🔒" + days[5],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width / 2.6,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 0,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Row(children: [
                              Text(
                                "         Cancel",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ]),
                          ),
                        ),
                        const SizedBox(
                          width: 0,
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width / 2.6,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.black, width: 2),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 0,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Row(children: [
                              Text(
                                "       Done",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ]),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
