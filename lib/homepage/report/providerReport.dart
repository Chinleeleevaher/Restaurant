
import 'package:flutter/cupertino.dart';
import 'package:myproject/homepage/report/orderModel/orderDetailModels.dart';
import 'package:myproject/homepage/report/orderModel/reportmodel.dart';

import 'productModel/getproductmodel.dart';
import 'orderModel/orderDetailModel.dart';

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
    getsellqty();
    notifyListeners();
  }

  //----to collect the  orderdetail specail for make loop below for product report-------------
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
    _AllcollectReport =
        []; // <---here is make clear if the AllcollectReport already have inside
    int AllQty = 0; // <---all quantity
    int collectQty = 0; // <---sell quntity
    int stillQty = 0; // <---still quntity
    bool match = true;
    for (int i = 0; i < getproductReport!.length; i++) {
      for (int j = 0; j < getorderdetailReport!.length; j++) {
        if (getproductReport![i].productId == getorderdetailReport![j].productId) {
          collectQty += getorderdetailReport![j].qty;
          AllQty = collectQty + getproductReport![i].quantity.toInt();
           stillQty = AllQty - collectQty;
          
        }
      }
      if(match = true){
        if(collectQty == 0){
      AllQty = getproductReport![i].quantity;
     stillQty = getproductReport![i].quantity;
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
      stillQty = 0; // <-------this is of sell qty
    
        }else{
          // AllQty = getproductReport![i].quantity;
     stillQty = getproductReport![i].quantity;
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
      stillQty = 0; // <-------this is of sell qty

        }
      
      }
    
    }
  }

//...................................................
  List<SelectOrderReportModels>? _selectOrderDetailReport;
  List<SelectOrderReportModels>? get selectOrderDetailReport =>
      _selectOrderDetailReport;

  selectOrderdetailreport(List<SelectOrderReportModels> value) {
    if (selectOrderDetailReport != 0) {
      _selectOrderDetailReport = value;
    }
    notifyListeners();
  }

  // ------to get order list of report-----------
  late SelectOrderReportModel _getorderlistReport;
  SelectOrderReportModel get getorderlistReport => _getorderlistReport;

  setOrderlistReport(SelectOrderReportModel value) {
    _getorderlistReport = value;
    notifyListeners();
  }

  //--------order report------------------
  //------of select order data by table status--------------
  List<SelectOrderReportModel>? _orderReport;
  List<SelectOrderReportModel>? get orderReport => _orderReport;
  OrderReport(List<SelectOrderReportModel> value) {
    if (orderReport != 0) {
      _orderReport = value;
    }
    notifyListeners();
  }

///......of week..........
  int weekAmount = 0 ;
    incomeWeekAmount(value) {
   weekAmount = value;
    notifyListeners();
  }
   int weekQty = 0;
    incomeWeekQty(value) {
   weekQty = value;
    notifyListeners();
  }
///......of month..........
  int? monthAmount;
    incomeMothAmount(value) {
   monthAmount = value;
    notifyListeners();
  }
   int? monthQty;
    incomeMothQty(value) {
   monthQty = value;
    notifyListeners();
  }
///......of year...........
  int? yearAmount;
  
    incomeYearAmount(value) {
   yearAmount = value;
    notifyListeners();
  }
  int? yearqty;
    incomeYearQty(value) {
   yearqty = value;
    notifyListeners();
  }
}
