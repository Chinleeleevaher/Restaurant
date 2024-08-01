// ignore_for_file: file_names, non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:myproject/homepage/kitchen/model/kitchenOrderlistModel.dart';
import 'package:myproject/homepage/kitchen/model/orderdetailModel.dart';
import 'package:myproject/homepage/kitchen/model/rejectModel.dart';
import 'package:myproject/homepage/order_history/rejectModel.dart';

class kitchenProvider extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    notifyListeners();
  }

//----to collect the  order list here-------------
// RejectModel? _getrejectModel;
// RejectModel? get getrejectModel => _getrejectModel;
 
//   TogetgetrejecModel(RejectModel? value) {
//     _getrejectModel = value!;
//    Togetgetrejectorder(getrejectModel);
//     notifyListeners();
//   }

List<RejectOrderModel>_getrejectorder = [];
List<RejectOrderModel> get getrejectorder => _getrejectorder;
 
  Togetgetrejectorder(value) {
    _getrejectorder = value;
   
    notifyListeners();
  }
List<OrderForKitchen>?_getOrderlist;
List<OrderForKitchen>? get getOrderlist => _getOrderlist;
 
  TogetgetOrderlist(List<OrderForKitchen>? value) {
    _getOrderlist = value;
   
    notifyListeners();
  }
}
