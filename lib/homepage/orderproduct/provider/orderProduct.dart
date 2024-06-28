import 'package:flutter/cupertino.dart';
import 'package:myproject/homepage/orderproduct/model/orderproductModel.dart';
import 'package:myproject/homepage/orderproduct/model/postOrderModel.dart';
import 'package:myproject/homepage/report/orderDetailModels.dart';
import 'package:myproject/homepage/report/reportmodel.dart';

class OrderProductProvider extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    notifyListeners();
  }

//----to collect the  product report data here-------------
  List<OrderProductModel>? _getproductOrder = [];
  List<OrderProductModel>? get getproductOrder => _getproductOrder;
  int _totalprice = 0;
  int get totalprice => _totalprice;
  TogetgetprodutOrdert(List<OrderProductModel> value) async {
    _getproductOrder = value;

    if (proID == null && proIDs == null) {
      for (int i = 0; i < getproductOrder!.length; i++) {
        getproductOrder![i].cost = getproductOrder![i].price;
        getproductOrder![i].quantity = 0;
        getproductOrder![i].price = 0;
        _totalprice = 0;
      }
    }

    if (proID != null) {
      for (int i = 0; i < getproductOrder!.length; i++) {
        if (proID == getproductOrder![i].productId) {
          getproductOrder![i].quantity += 1;
          getproductOrder![i].price =
              getproductOrder![i].cost * getproductOrder![i].quantity;
          _totalprice += getproductOrder![i].cost;
          proID = null;
          break;
        }
      }
    }
    if (proIDs != null) {
      for (int i = 0; i < getproductOrder!.length; i++) {
        if (proIDs == getproductOrder![i].productId) {
          if (getproductOrder![i].quantity > 0) {
            getproductOrder![i].quantity -= 1;
            getproductOrder![i].price =
                getproductOrder![i].cost * getproductOrder![i].quantity;
            _totalprice -= getproductOrder![i].cost;
          }
          proIDs = null;

          break;
        }
      }
    }

    notifyListeners();
  }

//increment
  String? proID;
  collectQty(value) {
    proID = value;
    TogetgetprodutOrdert(_getproductOrder!);
  }

  ///minus
  String? proIDs;
  minustQty(value) {
    proIDs = value;
    TogetgetprodutOrdert(_getproductOrder!);
  }

  // collect data of order product
  List<PostorderProductModel>? _collectproductOrder = [];
  int listTotalPrice = 0;
  List<PostorderProductModel>? get collectproductOrder => _collectproductOrder;
  ToCollectprodutOrdert(List<PostorderProductModel> value) async {
    _collectproductOrder = value;
    if (listTotalPrice == 0) {
      for (int i = 0; i < collectproductOrder!.length; i++) {
        listTotalPrice += collectproductOrder![i].orpPrice;
      }
    } else {
      listTotalPrice = 0;
      for (int i = 0; i < collectproductOrder!.length; i++) {
        listTotalPrice += collectproductOrder![i].orpPrice;
      }
    }
  }

  notifyListeners();
}
