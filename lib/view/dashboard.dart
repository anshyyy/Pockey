import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:pockey/widget/tile.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool press = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Container(
        padding: const EdgeInsets.only(left: 10, top: 20, right: 5),
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
              height: 40,
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
                  color: Colors.white),
              padding: const EdgeInsets.only(
                left: 19,
                right: 15,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    activeColor: Colors.amber,
                    activeTrackColor: Colors.blueAccent,
                    inactiveThumbColor: Colors.blueGrey.shade600,
                    inactiveTrackColor: Colors.grey.shade400,
                    splashRadius: 50.0,
                    // boolean variable value
                    value: press,
                    // changes the state of the switch
                    onChanged: (value) => setState(() => press = value),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
