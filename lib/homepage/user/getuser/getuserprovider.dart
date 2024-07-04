import 'package:flutter/cupertino.dart';
import 'package:myproject/homepage/user/model/getUserDetailModel.dart';
import 'package:myproject/homepage/user/model/getUserMoldel.dart';

class getUserProvider extends ChangeNotifier {
  bool _isprocessing = true;
  bool get isprocessing => _isprocessing;

  setIsprocessing(bool value) {
    _isprocessing = value;
    notifyListeners();
  }

//----to collect the  order list here-------------
  List<GetUserModel>? _getUser;
  List<GetUserModel>? get getUser => _getUser;
  TogetgetUser(List<GetUserModel> value) {
    _getUser = value;
    notifyListeners();
  }

//......to get select user Id to make loop loop to show the order detail...............
  late int _getUserID;
  int get getUserID => _getUserID;

  getSelectUserID(value) {
    _getUserID = value;
    getUserdetails();
  }

  ///....to collect th user detail data to show in the user detail dailog...........
  GetUserDetailModel? _getUserDetail;
  GetUserDetailModel? get getUserDetail => _getUserDetail;
  void getUserdetails() {
    for (int i = 0; i < getUser!.length; i++) {
      if (getUserID == getUser![i].uid) {
        _getUserDetail = GetUserDetailModel(
            uid: getUser![i].uid,
            username: getUser![i].username,
            email: getUser![i].email,
            password: getUser![i].password,
            phone: getUser![i].phone,
            gender: getUser![i].gender,
            address: getUser![i].address,
            status: getUser![i].status,
            image: getUser![i].image);
            break;
      }
      
    }
  }
  clearData(){
    _getUserDetail = null;
      notifyListeners();
  }
}
