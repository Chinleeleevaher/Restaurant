import 'package:flutter/material.dart';
import 'package:myproject/homepage/addcategory/component/model.dart';
import 'package:myproject/homepage/menu_page/model/model.dart';

class categoryProvider extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    notifyListeners();
  }
 
//----to collect the  producttype-------------
  List<Producttype>? _geproducttype = [];
  List<Producttype>? get geproducttype => _geproducttype;
  TogetProductType(List<Producttype> value) {
    _geproducttype = value;
    notifyListeners();
  }

  //----to collect the  producttype for get update-------------
  Producttype? _geCate ;
  Producttype? get getupdate => _geCate;
  getCateUpdate(Producttype? value) {
    _geCate = value;
    notifyListeners();
  }
  }

