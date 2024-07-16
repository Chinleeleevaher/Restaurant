import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/homepage/menu_page/tablemenuModel.dart';
import 'package:myproject/homepage/table_page/model/order_table_Model.dart';
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
 //.........the below conditon is to get order status.....
  late int _getOrdrStatus;
  int get getOrdrStatus => _getOrdrStatus;


  ///..........of order from menu....................
  //..............for show table number in ter orderlist................
    int? _tID;
  int? get tID => _tID;
  String? _tname;
  String? get tname => _tname;

   late Menutable _gettablelistMenu;
  Menutable get gettablelistMenu => _gettablelistMenu;
  settableid(Menutable value){
_gettablelistMenu = value;
 _tname = value.tableName;
 _tID = value.tableId;
    notifyListeners();
  }
  //...clear only tId.....
   clearttID() {
    _tID = null;
    _tname = null;
    notifyListeners();
  }
///.................of order from order pahe..........................
     String? _tablenumber;
  String? get tablenumber => _tablenumber;
  settablelist(Tables value) {
    _tablenumber = value.tableName; // <-- this is add the table name to the table number
    _gettablelist = value;
    // <--here is to add the value to get table
    //.........the below conditon is to get order status.....
    if(value.tableStatus == 1){
      _getOrdrStatus = 1;
    }
    if (value.tableStatus == 2) {
       _getOrdrStatus = 2;
    }
    notifyListeners();
  }

//********************************** Move table ***************************************************************** */
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
//--------------of name-----------------
  late String _from_table = "...";
  String get fromtable => _from_table;
  late String _to_table = "....";
  String get totable => _to_table;
//-------------of id-------------
  late int _from_table_Id = 0;
  int get fromtable_Id => _from_table_Id;

  late int _to_table_Id = 0;
  int get totable_Id => _to_table_Id;
  movetable(Tables value) {
    // _from_table = value.tableName;
    _changeTable = value; // <--here is to add the value to get table

    // ignore: unnecessary_null_comparison

    /// ນີ້ແມ່ນແຕ່ລະຕູບທີ່ເຮົາເລືອກ ແລ້ວ ໃຫ້ມັນໄສະແດງຢູ່ເທີ່ງໂຕະ ແລ້ວ ເຮັດການຍ້າຍ
    /// ແລະ ເຮົາເລືອກຕາມສະຖານະ
    if (FromTable == "1" && _changeTable.tableName != _to_table) {
      if (_changeTable.tableStatus == 2) {
        _from_table = value.tableName;
        _from_table_Id = value.tableId;
      }
      else{
         Fluttertoast.showToast(
            msg: "ກາລຸນາເລືອກຕູບທີ່ຕ້ອງການຍ້າຍ",
            gravity: ToastGravity.CENTER);
      }
    }
    if (ToTable == "2") {
      if ((_changeTable.tableStatus == 2 || _changeTable.tableStatus == 0) &&
          _changeTable.tableName != _from_table) {
        _to_table = value.tableName;
        _to_table_Id = value.tableId;
      } else if(_changeTable.tableStatus == 1){
  Fluttertoast.showToast(
            msg: "ຕູບນີ້ກໍາລັງລໍຖ້າຢູ່",
            gravity: ToastGravity.CENTER);
      }
       else{
         Fluttertoast.showToast(
            msg: "ກາລຸນາເລືອກຕູບທີ່ຕ້ອງການຍ້າຍໄປຫາ",
            gravity: ToastGravity.CENTER);
      }
    }
    notifyListeners();
  }

  clearTable() {
    _from_table = "...";
    _to_table = "...";
    _FromTable = ".....";
    _ToTable = ".....";
    _from_table_Id = 0;
    _to_table_Id = 0;
    notifyListeners();
  }

//-------------the above is mange for chose and the below code is manage the the menu list------------------------------
  //----here is to get data of table that we want to move to the other-------
  List<SelectOrderByTableModel>? _getorderFromTableid;
  List<SelectOrderByTableModel>? get getorderFromTableid =>
      _getorderFromTableid;

  getorderFromTableID(List<SelectOrderByTableModel> value) {
    if (getorderFromTableid != 0) {
      _getorderFromTableid = value;
    }
    notifyListeners();
  }

  //----here is to get data of table that we want move to-------
  List<SelectOrderByTableModel>? _getorderToTableid;
  List<SelectOrderByTableModel>? get getorderToTableid => _getorderToTableid;

  getorderToTableID(List<SelectOrderByTableModel> value) {
    if (getorderToTableid != 0) {
      _getorderToTableid = value;
    }
    getMovetableOrderlist = null;
    notifyListeners();
  }

//-----this is get loop the move table order data--------------
  List<SelectOrderByTableModel>? _getMOvetableorder;
  List<SelectOrderByTableModel>? get getMOvetableorder =>
      _getMOvetableorder; // <-- keep every thing inside this just bring it to use or show

  set getMovetableOrderlist(List<SelectOrderByTableModel>? value) {
    if ((_getMOvetableorder == null || _getMOvetableorder!.isEmpty) &&
        getorderToTableid!.isEmpty) {
      // <---if the table that i want to move to emty so come to this case and just move the list menu to it.
      _getMOvetableorder = [];
      _getMOvetableorder!.addAll(getorderFromTableid!);
    } else {
      // <----if the table i want to move to is not emty so come to this case and loop if any menu match so just add the qty and amount to it. if not match then go the next case
      for (int i = 0; i < getorderFromTableid!.length; i++) {
        bool foundMatch = false;
        for (int j = 0; j < getorderToTableid!.length; j++) {
          if (getorderToTableid![j].productId ==
              getorderFromTableid![i].productId) {
            getorderToTableid![j].qty += getorderFromTableid![i].qty;
            getorderToTableid![j].amount += getorderFromTableid![i].amount;
            _getMOvetableorder ??= [];
            _getMOvetableorder!.add(getorderToTableid![j]);
            foundMatch = true;
            break;
          }
        }
        if (!foundMatch) {
          // <---- in this case if the list menu above not match then come to this case and then check a gain is the _getMOvetableorder emty? if emty so add the getorderToTableid plus menu list together in to it. if not emty so just add the menu list to it
          _getMOvetableorder ??= [];
          if (_getMOvetableorder!.isEmpty) {
            SelectOrderByTableModel
                model = // <----this function i have to do this be cose i need to update the orId of getfromtable to getTotable
                SelectOrderByTableModel(
                    orId: getorderToTableid![0].orId,
                    productId: getorderFromTableid![i].productId,
                    amount: getorderFromTableid![i].amount,
                    orAmount: getorderFromTableid![i].orAmount,
                    orDate: getorderFromTableid![i].orDate,
                    ordId: getorderFromTableid![i].ordId,
                    price: getorderFromTableid![i].price,
                    productName: getorderFromTableid![i].productName,
                    qty: getorderFromTableid![i].qty,
                    tableId: getorderFromTableid![i].tableId);
            List<SelectOrderByTableModel> combinedList =
                getorderToTableid! + [model];
            _getMOvetableorder!.addAll(combinedList);
          } else {
            // if(_getMOvetableorder!.isNotEmpty &&getorderFromTableid![i].isNull){
            //   return _getMOvetableorder!.add(value) //<--- continuse tomorow
            // }
            SelectOrderByTableModel moduls = SelectOrderByTableModel(
                orId: getorderToTableid![0].orId,
                productId: getorderFromTableid![i].productId,
                amount: getorderFromTableid![i].amount,
                orAmount: getorderFromTableid![i].orAmount,
                orDate: getorderFromTableid![i].orDate,
                ordId: getorderFromTableid![i].ordId,
                price: getorderFromTableid![i].price,
                productName: getorderFromTableid![i].productName,
                qty: getorderFromTableid![i].qty,
                tableId: getorderFromTableid![i].tableId);
            _getMOvetableorder!.add(moduls);
            //  break;
          }
        }
        //  }
      }
      notifyListeners();
    }
  }

  void clearData() {
    _getMOvetableorder = []; // this is make clear
    _getorderToTableid = [];
    _getorderFromTableid = [];
    notifyListeners();
  }

  //************************************************************************************************* */
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
