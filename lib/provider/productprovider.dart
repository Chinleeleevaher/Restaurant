import 'package:flutter/cupertino.dart';

import '../homepage/menu_page/model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    notifyListeners();
  }

 List<ProductModel>_productlist = [];
 List<ProductModel> get userlist => _productlist;

  setproductlist(List<ProductModel> value) {
    _productlist = value;
    notifyListeners();
  }
}