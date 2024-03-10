import 'package:flutter/material.dart';

class MaxNumber with ChangeNotifier {
  double _maxNumber = 1000;

  double getMaxValue() => _maxNumber;

  setMaxValue(double maxNumber) {
    _maxNumber = maxNumber;
    notifyListeners();
  }
}
