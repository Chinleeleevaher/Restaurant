import 'package:flutter/material.dart';
import 'package:myproject/model/loginmodel.dart';


class UserProvider extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    notifyListeners();
  }

  List<UserLoginModel> _userlist = [];
  List<UserLoginModel> get userlist => _userlist;

  setIsUserlist(List<UserLoginModel> value) {
    _userlist = value;
    notifyListeners();
  }
}
