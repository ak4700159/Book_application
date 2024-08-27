import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int num = 0;

  void increment() {
    num++;
    notifyListeners();
  }
}
