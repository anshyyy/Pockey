import 'package:flutter/material.dart';

Map<String, List<Map<String, dynamic>>> expenseData = {
  "2023-05-01": [
    {
      "category": "food",
      "money": "50",
    }
  ]
};

void addData(String date, Map<String, dynamic> data) {
  if (!expenseData.containsKey(date)) {
    expenseData[date] = [];
  }
  List<Map<String, dynamic>>? items = expenseData[date];
  items?.add(data);
  expenseData[date] = items!;
}
