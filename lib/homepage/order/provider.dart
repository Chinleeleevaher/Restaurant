import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:myproject/homepage/menu_page/model/product_model.dart';
import 'package:myproject/homepage/order/model/orderproductmodel.dart';
import 'package:myproject/homepage/table_page/model/order_table_Model.dart';
import 'package:myproject/homepage/table_page/model/orderlistmodel.dart';
import 'package:myproject/homepage/table_page/model/orderlistmodel.dart';
import 'package:myproject/homepage/table_page/model/orderlistmodel.dart';
import 'package:myproject/homepage/table_page/model/table.dart';
import 'package:myproject/homepage/table_page/model/table_status.dart';

import '../table_page/model/orderlistmodel.dart';
import '../table_page/model/orderlistmodel.dart';

class orderprovider extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    notifyListeners();
  }

  // late ProductModel _orderlist;
  // ProductModel get orderlist => _orderlist;

  // setorderlist(ProductModel value) {
  //   _orderlist = value;
  //   notifyListeners();
  // }

// ------to get order list-----------
  List<OrderproductModel> _getorderlist = [];
  List<OrderproductModel> get getorderlist => _getorderlist;

  setOrderlist(OrderproductModel value) {
    if (getorderlist.isEmpty) {
      _getorderlist.add(value);
      setbageqty = null;
      settotalprice = null;
      settotalqty = null;
    } else {
      for (int j = 0; j < getorderlist.length; j++) {
        if (value.productId == getorderlist[j].productId) {
          getorderlist[j].qty += 1;
          setbageqty = null;
          settotalprice = null;
          settotalqty = null;

          return;
        }
        // _getorderlist.add(value);
        //   setbageqty = null;
      }
      _getorderlist.add(value);
      setbageqty = null;
      settotalprice = null;
      settotalqty = null;
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

  set settotalprice(int? value) {
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
    print(getOrdertables);
    notifyListeners();
  }
//------of table status--------------
   Tablestatus? _tablestatus;
   Tablestatus? get tablestatus => _tablestatus;

  ordertable(Tablestatus value) {
    if (tablestatus != 0) {
      _tablestatus = value;
    }
    print(getOrdertables);
    notifyListeners();
  }

  //------of select order data by table status--------------
   List<SelectOrderByTableModel>? _selectorderstatus;
List<SelectOrderByTableModel>? get selectorderdata => _selectorderstatus;

  selectOrderStatus(List<SelectOrderByTableModel> value) {
    if (selectorderdata != 0) {
      _selectorderstatus = value;
    }
    print(selectorderdata);
    notifyListeners();
  }
}
