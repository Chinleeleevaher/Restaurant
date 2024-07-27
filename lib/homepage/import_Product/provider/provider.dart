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
List<improtBillModel>? _getImportProduct = [];
  List<improtBillModel>? get getImportProduct => _getImportProduct;

  setImportProduct(List<improtBillModel> value) {
    _getImportProduct = value;
    notifyListeners();
  }

}
