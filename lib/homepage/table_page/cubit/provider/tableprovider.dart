import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myproject/homepage/table_page/model/orderlistmodel.dart';
import 'package:myproject/homepage/table_page/model/selectOrderToProvider.dart';
import 'package:myproject/homepage/table_page/model/table.dart';

class tableProvider extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    movetable;
    notifyListeners();
  }

  ///------this below code id make for where order page ----------
  late Tables _gettablelist;
  Tables get gettablelist => _gettablelist;

  late String _tablenumber;
  String get tablenumber => _tablenumber;
  settablelist(Tables value) {
    _tablenumber =
        value.tableName; // <-- this is add the table name to the table number
    _gettablelist = value;
    // <--here is to add the value to get table
    notifyListeners();
  }

  ///----this below code is make for where change table-------
  String _FromTable = ".....";
  String get FromTable => _FromTable;
  String _ToTable = ".....";
  String get ToTable => _ToTable;
  setfromtable(String? value) {
    if (value == "1") {
      _FromTable = value!;
      _ToTable = ".....";
    }
    if (value == "2") {
      _ToTable = value!;
      _FromTable = ".....";
    }
    notifyListeners();
  }

  //---of change or move table-------------
  late Tables _changeTable;
  Tables get changeTable => _changeTable;
  late String _from_table = "...";
  String get fromtable => _from_table;
  late String _to_table = "....";
  String get totable => _to_table;
  movetable(Tables value) {
    // _from_table = value.tableName;
    _changeTable = value; // <--here is to add the value to get table

    // ignore: unnecessary_null_comparison
    if (FromTable == "1" && _changeTable.tableName != _to_table) {
      if (_changeTable.tableStatus == 1) {
        _from_table = value.tableName;
      }
    }
    if (ToTable == "2") {
      if ((_changeTable.tableStatus == 1 || _changeTable.tableStatus == 0) &&
          _changeTable.tableName != _from_table) {
        _to_table = value.tableName;
      }
    }
    notifyListeners();
  }

  //------here is to collect the order id and send to make update again in the payment
  SelectOrderToProviderMode? _getorderid;
  SelectOrderToProviderMode? get getorderid => _getorderid;
  getorderID(SelectOrderToProviderMode value) {
    if (getorderid != 0) {
      _getorderid = value;
    }
    notifyListeners();
  }
}
