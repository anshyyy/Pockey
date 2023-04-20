import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  String? _amount;

  factory SessionManager() {
    return _instance;
  }

  SessionManager._internal();

  Future<String?> get getAmountData async {
    if(_amount == null) {
      final prefs = await SharedPreferences.getInstance();
      _amount = prefs.getString('incomeMoney') ?? "888";
    }
    return _amount;
  }

  Future<void> updateAmountData(String? amount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('incomeMoney', amount ?? '888');
    _amount = amount;
  }
}