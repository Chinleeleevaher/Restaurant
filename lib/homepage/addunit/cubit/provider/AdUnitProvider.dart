
// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:myproject/homepage/menu_page/model/unit.dart';

class UnitProvider extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    notifyListeners();
  }
 
//----to collect the  producttype-------------
  List<punit>? _geUnit = [];
  List<punit>? get getUnit => _geUnit;
  TogeUnit(List<punit> value) {
    _geUnit = value;
    notifyListeners();
  }

  //----to collect the  producttype-------------
  punit? _getUnit ;
  punit? get getupdate => _getUnit;
  getUnitUpdate(punit? value) {
    _getUnit = value;
    notifyListeners();
  }
  }