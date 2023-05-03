import 'package:flutter/material.dart';

class RecentExpenseWidget extends StatefulWidget {
  String date;
  List<Map<String, dynamic>> exp;
  RecentExpenseWidget({super.key, required this.date, required this.exp});

  @override
  State<RecentExpenseWidget> createState() => _RecentExpenseWidgetState();
}

class _RecentExpenseWidgetState extends State<RecentExpenseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.date,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.exp.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> item = widget.exp[index];
              return ListTile(
                title: Text(item['category']),
                trailing: Text('₹${item['money']}'),
              );
            },
          )
        ],
      ),
    ));
  }
}
