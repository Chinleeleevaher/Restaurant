import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/homepage/kitchen/cubit/provider/providerOrder_kitchen.dart';
import 'package:myproject/homepage/kitchen/model/orderbyOrderStatusModel.dart';
import 'package:myproject/homepage/kitchen/model/orderdetailModel.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'kitchen_state.dart';

class KitchenCubit extends Cubit<KitchenState> {
  final AuthenRepository authenRepository;
  final BuildContext context;
  // final kitchenProvider kitchenProvide;
  KitchenCubit({
    required this.authenRepository,
    required this.context,
    // required this.kitchenProvide
  }) : super(KitchenState());

  bool mounted = true;
  @override
  Future<void> close() {
    mounted = false;
    return super.close();
  }

//..........of get order by order status for kitchen...............
  Future<void> SelectorderbyOrderStatus() async {
    if (mounted) {
      emit(state.coppywith(status_c: statuslist.loading));
    }
    var result = await authenRepository.GetOrderByOrderStatus();
    result!.fold((l) {
      log("Update status error $l");
      if (mounted) {
        emit(state.coppywith(status_c: statuslist.error));
      }
    }, (data) {
      log('data loading===${data}');
      if (mounted) {
        emit(state.coppywith(status_c: statuslist.success, listOrder_c: data));
      }
    });
  }

//..........type select order id.................
  Future<void> ontypeSelect(OrderStatusModel? value) async {
    emit(state.coppywith(typeSeletOrderId_c: value!));
    // kitchenProvide.TogetgetOrderlist(value);
    log("select already");
    await SelectOrderdetail_kitchen();
  }

  // ...........of get order detail by order status for kitchen............
  Future<void> SelectOrderdetail_kitchen() async {
    emit(state.coppywith(loadBillStatus: statuslist.loading));
    var result = await authenRepository.getOrderdetail_kitchen(
        or_ids: state.typeSeletOrderId!.orId);
    result!.fold((l) {
      log("Update status error $l");
      emit(state.coppywith(loadBillStatus: statuslist.error));
    }, (data) {
      emit(state.coppywith(
          loadBillStatus: statuslist.success, listOrderdetail_c: data));
      billDialog();
    });
  }

  // ...........of get update tatble status and order status for kitchen............
  Future<void> getupdateTableStatus_orStatus() async {
    //emit(state.coppywith(status_c: statuslist.loading));
    Navigator.of(context).pop();
    MyProgress().loadingProgress(context: context,title: 'Updating');
    // await Future.delayed(const Duration(seconds: 3));
    var result = await authenRepository.getupdateTableStatus_OrderStatus(
        or_id: state.typeSeletOrderId!.orId,
        table_id: state.typeSeletOrderId!.tableId);
    result!.fold((l) {
      log("Update status error $l");
      Navigator.of(context).pop();
    }, (success) {
      Navigator.of(context).pop();
      SelectorderbyOrderStatus();
      //emit(state.coppywith(status_c: statuslist.success));
    });
  }

  billDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Bill',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.table_bar,
                        color: Colors.red,
                        size: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          state.typeSeletOrderId!.tableId.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Text(""),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Text("Bill No:  " +
                      //     "VT" +
                      //     tableprovi.tablenumber),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Text("Date: " + _currentDateTime),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("ລ/ດ"),
                      Text("ຊື້ອາຫານ"),
                      Text("ຈໍານວນ "),
                    ],
                  ),
                ),
                Divider(),
                Expanded(
                  child: Builder(builder: (context) {
                    if (state.loadBillStatus == statuslist.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                      children: List.generate(state.listOrderdetail!.length,
                          //   orderproviders.selectorderdata!.length,
                          (index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text((index + 1).toString()),
                                  Text(state
                                      .listOrderdetail![index].productName),
                                  Text(state.listOrderdetail![index].qty
                                      .toString()),
                                ],
                              ),
                            ),
                            DottedLine(
                              //<---this is make draw the dotted line
                              dashGapLength: 5,
                              dashLength: 5,
                              dashColor: Colors.black,
                            ),
                          ],
                        );
                      }),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "ຈໍານວນທັງໝົດ:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(state.typeSeletOrderId!.orQty.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        child: Text('wait'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        child: Text('Print'),
                        onPressed: () {
                          getupdateTableStatus_orStatus();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
