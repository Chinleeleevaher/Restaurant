
// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myproject/homepage/addtable/model/tableModel.dart';

class tableProviderss extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    notifyListeners();
  }
 
//----to collect the  producttype-------------
  List<TableModel>? _getTable = [];
  List<TableModel>? get getTable => _getTable;
  Togettable(List<TableModel> value) {
    _getTable = value;
    notifyListeners();
  }

  //----to collect the  producttype-------------
  TableModel? _tableUpdate ;
  TableModel? get tableUpdate => _tableUpdate;
  gettableUpdates(TableModel? value) {
    _tableUpdate = value;
    notifyListeners();
  }
  }