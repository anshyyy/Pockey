import "package:circular_motion/circular_motion.dart";
import "package:flutter/material.dart";
import "package:neubrutalism_ui/neubrutalism_ui.dart";
import 'dart:math';

class AddGoal extends StatefulWidget {
  List<String> categories;
  AddGoal({super.key, required this.categories});

  @override
  State<AddGoal> createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  bool selected = false;
  final List<Color> color = [
    Colors.red,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.yellow
  ];

  final List<String> days = ["7", "30", "60", "90", "120", "150"];

  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.amber[100],
          title: const Text(
            "Add Goal",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
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
                            hintText: "",
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
              Text(
                "------------------------------------------",
              ),
              Center(
                child: SizedBox(
                  width: 320,
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
                      children: List.generate(
                        days.length,
                        (index) {
                          return InkWell(
                            onTap: () {
                              print(index);
                              print(selected);
                              setState(() {
                                selected = false;
                              });
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.primaries[index],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  (selected == false)
                                      ? days[index]
                                      : "🔒" + days[index],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
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
                          height: 50,
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
                              "          Cancel",
                              style: TextStyle(fontSize: 17),
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
                          height: 50,
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
                              "          Done",
                              style: TextStyle(fontSize: 17),
                            )
                          ]),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
