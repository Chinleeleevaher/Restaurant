import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myproject/homepage/table_page/model/table.dart';

class tableProvider extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    notifyListeners();
  }

   late Tables _gettablelist;
  Tables get gettablelist => _gettablelist;

  late String _tablenumber;
  String get tablenumber => _tablenumber;
  settablelist(Tables value) {
    _tablenumber = value.tableName; // <-- this is add the table name to the table number
    _gettablelist = value; // <--here is to add the value to get table
  }

  // late String _dateTime;
  // String get currentdatetime => _dateTime;
  // setdatime(){
  //     _dateTime = DateFormat('yyyy hh:mm:ss a').format(DateTime.now());
  // }
}
