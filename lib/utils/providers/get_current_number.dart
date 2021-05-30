import 'package:flutter/cupertino.dart';
import 'dart:math';

class GetCurrentNumber with ChangeNotifier {

  Random _rng = Random();

  int? _currentNumber;

  int? get currentNumber => _currentNumber;

  void initNumber({required int num}) {
    _currentNumber = num;
  }

  void changeCurrentNumber() {
    int num = _rng.nextInt(100);
    if (_currentNumber! != num) {
      _currentNumber = num;
      notifyListeners();
    }
  }
}