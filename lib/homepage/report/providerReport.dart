import 'package:flutter/cupertino.dart';

import 'getproductmodel.dart';
import 'orderDetailModel.dart';

class ReportProvider extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    notifyListeners();
  }

//----to collect the  product report data here-------------
  List<GetProductModel>? _getproductReport = [];
  List<GetProductModel>? get getproductReport => _getproductReport;
  TogetgetprodutReport(List<GetProductModel> value) {
    _getproductReport = value;
    notifyListeners();
  }

  //----to collect the  orderdetail to make report data here-------------
  List<GetOrderDetailModel>? _getorderdetailReport = [];
  List<GetOrderDetailModel>? get getorderdetailReport => _getorderdetailReport;
  TogetorderdetailReport(List<GetOrderDetailModel> value) {
    _getorderdetailReport = value;
    getsellqty();
    notifyListeners();
  }

  ///-----------here is make loop to get the value of qty to make report-------
  List<GetProductModel>? _AllcollectReport = [];
  List<GetProductModel>? get AllcollectReport => _AllcollectReport;
  getsellqty() {
    _AllcollectReport = []; // <---here is make clear if the AllcollectReport already have inside
    int AllQty = 0; // <---all quantity
    int collectQty = 0; // <---sell quntity
    for (int i = 0; i < getproductReport!.length; i++) {
      for (int j = 0; j < getorderdetailReport!.length; j++) {
        if (getproductReport![i].productId ==
            getorderdetailReport![j].productId) {
          collectQty += getorderdetailReport![j].qty;
          AllQty = collectQty + getproductReport![i].quantity.toInt();
        }
      }
      GetProductModel model = GetProductModel(
          cost: getproductReport![i].cost,
          image: getproductReport![i].image,
          productId: getproductReport![i].productId,
          price: getproductReport![i].price,
          productName: getproductReport![i].productName,
          quantity: getproductReport![i]
              .quantity, // <---this is collect the still quantity
          unitId:
              collectQty, // <---this line actually is of unitID but i just make to collect the Sell qty instead
          protypeId:
              AllQty // <---this line actually is of product type is but i just make to collect the AllQty instead
          );
      _AllcollectReport!.add(model);
      AllQty = 0; // <----this is of AllQty
      collectQty = 0; // <-------this is of sell qty
    }
  }
}
