import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:myproject/homepage/menu_page/model/product_model.dart';
import 'package:myproject/homepage/order/model/orderproductmodel.dart';

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
}
