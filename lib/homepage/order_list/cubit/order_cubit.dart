import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/menu_page/menuProvider.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/order_list/addDailog.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/repository/authen_sipository.dart';

import '../../table_page/model/orderlistmodel.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final orderprovider orderproviders;
  final BuildContext context;
  final tableProvider tableproviders;
  final tableprovide tableprovideMenuPage;

  final AuthenRepository authenRepositorys;
  //final TextEditingController a = TextEditingController(text: orderproviders.getorderlist);
  OrderCubit({
    required this.authenRepositorys,
    required this.tableproviders,
    required this.tableprovideMenuPage,
    required this.orderproviders,
    required this.context,
  }) : super(OrderState());
  //-----to update table status--------------

  Future<void> updatetablestatus() async {
     MyProgress().loadingProgress(
      context: context,
      title: 'ກໍາລັງສັ່ງຊື້',
    );
     await Future.delayed(const Duration(seconds: 1));
    emit(state.coppywith(status_c: orderproductstatuse.loading));
    var result = await authenRepositorys.updatetablestattus(
        tablestatus: 1, table_id: tableproviders.gettablelist.tableId);
    result!.fold((l) {
      log("Update status error $l");
    }, (Right) {
      emit(state.coppywith(status_c: orderproductstatuse.success));
      orderproviders.ordertable(Right);
      //   tableproviders.tablenumber == ""; // ....here is to make clear table name
      postorderlist();
      Navigator.pop(context);
     
    });
     
  }

//----to order product list-------
  Future<void> postorderlist() async {
    emit(state.coppywith(status_c: orderproductstatuse.loading));
    var result = await authenRepositorys.orderpro(
        order_qty: orderproviders.totalqty,
        order_amount: orderproviders.totalprice.toInt(),
        order_table: tableproviders.gettablelist.tableId,
        order_status: orderproviders.tablestatus!.tableStatus);
    result.fold((f) {
      log("Error1111 $f");
    }, (data) {
      orderproviders.orderlisttable(
          data!); // <--here is to keep value to the orderprovider
      print("respomse $Right");
      emit(state.coppywith(status_c: orderproductstatuse.success));
      postorderdetail().then((value) {
        //---this below code is to make clear and send the value true back to the table page
        orderproviders.clearorderlist();
        Navigator.pop(context);
        Navigator.pop(context, true);
      }); // <--this is call from below fucntion
      //  updatetablestatus();// <--this is call from below fucntion
    });
  }

//----to inser oder detail product----
  Future<bool?> postorderdetail() async {
    for (int i = 0; i < orderproviders.getorderlist.length; i++) {
      emit(state.coppywith(status_c: orderproductstatuse.loading));
      var result = await authenRepositorys.orderproductdetail(
        order_id: orderproviders
            .getOrdertables!.orId, //--- get the value from order list table
        product_id: orderproviders.getorderlist[i].productId,
        table_id: tableproviders.gettablelist.tableId,
        qty: orderproviders.getorderlist[i].qty,
        amount: orderproviders.getorderlist[i].price *
            orderproviders.getorderlist[i].qty,
      );
      result!.fold((l) {
        log("Error detail=== $l");
      }, (r) {
        emit(state.coppywith(status_c: orderproductstatuse.success));
      });
    }
     Fluttertoast.showToast(
      msg: "ໄດ້ຮັບອໍເດີແລ້ວອົດໃຈລໍຖ້າ",
      gravity: ToastGravity.CENTER,
    );
  }

  ///...update table id form order menu page
  Future<void> updatetableStatetu() async {
    MyProgress().loadingProgress(context: context, title: 'ກໍາລັງສັ່ງຊື້');
    await Future.delayed(const Duration(seconds: 1));
    emit(state.coppywith(status_c: orderproductstatuse.loading));
    var result = await authenRepositorys.updatetablestattus(
        tablestatus: 1, table_id: tableproviders.tID!.toInt());
    result!.fold((l) {}, (Right) {
      emit(state.coppywith(status_c: orderproductstatuse.success));
      orderproviders.ordertable(Right);
      //   tableproviders.tablenumber == ""; // ....here is to make clear table name
      postorderlistMenu();
    });
  }

//----to order product list from Menu page-------
  Future<void> postorderlistMenu() async {
    emit(state.coppywith(status_c: orderproductstatuse.loading));
    var result = await authenRepositorys.orderpro(
        order_qty: tableprovideMenuPage.totalqty,
        order_amount: tableprovideMenuPage.totalprice.toInt(),
        order_table: tableproviders.tID!.toInt(),
        order_status: 1);
    result.fold((f) {
      log("Error1111 $f");
    }, (data) {
      orderproviders.orderlisttable(
          data!); // <--here is to keep value to the orderprovider
      print("respomse $Right");
      emit(state.coppywith(status_c: orderproductstatuse.success));
      postorderdetailMenu().then((value) {
        //---this below code is to make clear and send the value true back to the table page
        tableprovideMenuPage.clearorderlist();
        tableproviders.clearttID();
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context, true);
          navService.pushNamed(AppRount.menupage);
      }); // <--this is call from below fucntion
      //  updatetablestatus();// <--this is call from below fucntion
    });
  }

  //----to inser oder detail product from menu----
  Future<bool?> postorderdetailMenu() async {
    for (int i = 0; i < tableprovideMenuPage.getorderlist.length; i++) {
      emit(state.coppywith(status_c: orderproductstatuse.loading));
      var result = await authenRepositorys.orderproductdetail(
        order_id: orderproviders
            .getOrdertables!.orId, //--- get the value from order list table
        product_id: tableprovideMenuPage.getorderlist[i].productId,
        table_id: tableproviders.tID!.toInt(),
        qty: tableprovideMenuPage.getorderlist[i].qty,
        amount: tableprovideMenuPage.getorderlist[i].price *
            tableprovideMenuPage.getorderlist[i].qty,
      );
      result!.fold((l) {
        log("Error detail=== $l");
      }, (r) {
        emit(state.coppywith(status_c: orderproductstatuse.success));
      });
    }
    return null;
  }
// =================>>> of order <<<=======================================
  //...............this below is keep the order id for delete only...........................
  ontypeorderid(value) {
    orderproviders.collectorderId(value);
  }

  //...this below is keep the order id and qty to make loop for plus or minus the qty..........................
  ontypeOrID(value) {
    orderproviders.collectOrID(value);
  }
///.....of order.........
  ontyepQty(value) {
    orderproviders.collectOrderQty(value);
  }


  ///======>>>>.of order menu <<=======================.........
  //...............this below is keep the order id for delete only...........................
  ontypeorderidmenu(value) {
    tableprovideMenuPage.collectorderId(value);
  }
  //...this below is keep the order id and qty to make loop for plus or minus the qty......................
   ontypeOrIDmenu(value) {
    tableprovideMenuPage.collectOrID(value);
  }
  ontyepQtymenu(value) {
    tableprovideMenuPage.collectOrderQty(value);
  }
}
