import 'package:flutter/cupertino.dart';

class LoginNotifier with ChangeNotifier {

  String? _accountErrorMsg;
  String? get accountErrorMsg => _accountErrorMsg;

  String? _passwordErrorMsg;
  String? get passwordErrorMsg => _passwordErrorMsg;

  bool _accountValid = false;
  bool get accountValid => _accountValid;

  bool _passwordValid = false;
  bool get passwordValid => _passwordValid;

  void accountValidating({
    required String fieldValue,
  }) {
    if (fieldValue.length > 9) {
      _accountValid = true;
      _accountErrorMsg = null;
    } else {
      _accountValid = false;
      _accountErrorMsg = "少於10個字元";
    }
    notifyListeners();
  }

  void passwordValidating({
    required String fieldValue,
  }) {
    if (fieldValue.length > 9) {
      _passwordValid = true;
      _passwordErrorMsg = null;
    } else {
      _passwordValid = false;
      _passwordErrorMsg = "少於10個字元";
    }
    notifyListeners();
  }
}