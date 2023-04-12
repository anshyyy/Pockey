import 'package:pockey/widget/IndividualBar.dart';

class BarData {
  List<double> monthlyExpense;
  BarData({required this.monthlyExpense});
  List<IndividualBar> barData = [];
  void initializeBarData() {
    for (int i = 0; i < monthlyExpense.length; i++) {
      barData.add(IndividualBar(x: i + 1, y: monthlyExpense[i]));
    }
  }
}
