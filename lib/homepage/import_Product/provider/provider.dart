import 'package:flutter/cupertino.dart';
import 'package:myproject/homepage/import_Product/model/importModel.dart';

class ImpProduct extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    notifyListeners();
  }


  // ------to get order list of report-----------
  late OrderproductImprotsModel _getImportProduct;
  OrderproductImprotsModel get getImportProduct => _getImportProduct;

  setImportProduct(OrderproductImprotsModel value) {
    _getImportProduct = value;
    notifyListeners();
  }

}
