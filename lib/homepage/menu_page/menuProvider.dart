// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_final_fields, unrelated_type_equality_checks, file_names

import 'package:flutter/material.dart';
import 'package:myproject/homepage/menu_page/model/orderproductModel.dart';
import 'package:myproject/homepage/menu_page/tablemenuModel.dart';
import 'package:myproject/homepage/table_page/model/order_table_Model.dart';
import 'package:myproject/homepage/table_page/model/orderlistmodel.dart';
import 'package:myproject/homepage/table_page/model/table_status.dart';

class tableprovide extends ChangeNotifier {
  List<Menutable>? _geTableMenu;
  List<Menutable>? get geTableMenu => _geTableMenu;

  getTbleMenu(List<Menutable> value) {
    _geTableMenu = value;

    notifyListeners();
  }

    /// this below is to correct the qty and order id to keep make loop be low and for add or minus the qty
  String _orId = "";
  String get orId => _orId;
  collectOrID(value) {
    _orId = value;
  }

//......
int _orderqty = 0;
int get orderqty => _orderqty;
void collectOrderQty(int value) {
  _orderqty = value;

  if (getorderlist.isNotEmpty) {
    for (int j = 0; j < getorderlist.length; j++) {
      if (orId == getorderlist[j].productId) {
        // Update quantity in the order list
        getorderlist[j].qty = _orderqty;

        // Reset _orderqty after adding to the order list
        _orderqty = 0;

        // Print the updated quantity and reset _orderqty
       

        // Exit the loop since we found the item
        break;
      }
    }
    double prs = 0;
    for (int i = 0; i < getorderlist.length; i++) {
      prs += getorderlist[i].price * getorderlist[i].qty;
    }
    settotalprice = prs;
      int a = 0;
    for (var i = 0; i < getorderlist.length; i++) {
      a = getorderlist[i].qty + a;
    }
    _bageqty = a;
  }
}

//..........delete order list.............

  String _orderID = "";
  String get orderID => _orderID;
  collectorderId(value) {
    _orderID = value;
    if (getorderlist.isNotEmpty) {
      bool found = false;
      for (int j = 0; j < getorderlist.length; j++) {
        //...here is to delete order..........
        if (orderID == getorderlist[j].productId) {
          found = true;
          _getorderlist.removeAt(j);
          break;
        }
        //....here is to add the order qty............
        // if(orId == getorderlist[j].productId ){
        //   found = true;
        //      getorderlist[j].qty = orderqty;
        //      break;
        // }
      }
      if (!found) {
        _getorderlist.add(value);
      }
      setbageqty = null;
      settotalprice = 0;
      settotalqty = null;
    } else {
      _getorderlist.add(value);
      setbageqty = null;
      settotalprice = 0;
      settotalqty = null;
    }
  }

// ------to get order list-----------
  final List<OrderproductModelMenu> _getorderlist = [];
  List<OrderproductModelMenu> get getorderlist => _getorderlist;

  setOrderlist(OrderproductModelMenu value) {
    if (getorderlist.isEmpty) {
      _getorderlist.add(value);
      setbageqty = null;
      settotalprice = 0;
      settotalqty = null;
    } else {
      for (int j = 0; j < getorderlist.length; j++) {
        if (value.productId == getorderlist[j].productId) {
          getorderlist[j].qty += 1;
          setbageqty = null;
          settotalprice = 0;
          settotalqty = 0;
          return;
        }
        // _getorderlist.add(value);
        //   setbageqty = null;
      }
      _getorderlist.add(value);
      setbageqty = 0;
      settotalprice = 0;
      settotalqty = 0;
      // clearorderlist();
    }
    notifyListeners();
  }

//------here is for add bage------------
  int _bageqty = 0;
  int get getbageqty => _bageqty;

  set setbageqty(int? value) {
    int a = 0;
    for (var i = 0; i < getorderlist.length; i++) {
      a = getorderlist[i].qty + a;
    }
    _bageqty = a;
    notifyListeners();
  }

//------<of total price>---------
  double _totalprice = 0;
  double get totalprice => _totalprice;

  set settotalprice(double? value) {
    double pr = 0;
    for (int i = 0; i < getorderlist.length; i++) {
      pr = getorderlist[i].price * getorderlist[i].qty + pr;
    }
    _totalprice = pr;
    notifyListeners();
  }


//----of total qty---------------
  int _totalqty = 0;
  int get totalqty => _totalqty;

  set settotalqty(int? value) {
    int pr = 0;
    for (int i = 0; i < getorderlist.length; i++) {
      pr = getorderlist[i].qty + pr;
    }
    _totalqty = pr;
    notifyListeners();
  }

  //-----to clear orderlist--------------
  clearorderlist() {
    if (getorderlist.isNotEmpty && getbageqty != 0) {
      _getorderlist.clear();
      _bageqty = 0;
      _totalqty = 0;
      _totalprice = 0.00;
      
    }
    notifyListeners();
  }

  //-----get back tableorderlist from Api when i finsh insert table and status. this purpos is to send to the orderlist for insert again--------------
  Ordertable? _Ordertable;
  Ordertable? get getOrdertables => _Ordertable;
  int _order = 0;
  int get order => _order;
  orderlisttable(Ordertable value) {
    if (getOrdertables != 0) {
      _Ordertable = value;
    }
   
    notifyListeners();
  }

//------of table status--------------
  Tablestatus? _tablestatus;
  Tablestatus? get tablestatus => _tablestatus;

  ordertable(Tablestatus value) {
    if (tablestatus != 0) {
      _tablestatus = value;
    }
   
    notifyListeners();
  }

  //------of select order data by table status--------------
  List<SelectOrderByTableModel>? _selectorderstatus;
  List<SelectOrderByTableModel>? get selectorderdata => _selectorderstatus;

  selectOrderStatus(List<SelectOrderByTableModel> value) {
    if (selectorderdata != 0) {
      _selectorderstatus = value;
    }
    notifyListeners();
  }
}
