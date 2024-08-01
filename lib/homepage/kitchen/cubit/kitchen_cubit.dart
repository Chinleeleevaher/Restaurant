// ignore_for_file: unused_import, non_constant_identifier_names

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/homepage/kitchen/cubit/provider/providerOrder_kitchen.dart';
import 'package:myproject/homepage/kitchen/model/orderbyOrderStatusModel.dart';
import 'package:myproject/homepage/kitchen/model/orderdetailModel.dart';
import 'package:myproject/homepage/kitchen/model/rejectModel.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'kitchen_state.dart';

class KitchenCubit extends Cubit<KitchenState> {
  final AuthenRepository authenRepository;
  final kitchenProvider kitchenProviders;
  final BuildContext context;
 String productId;
  // final kitchenProvider kitchenProvide;
  KitchenCubit({
    required this.authenRepository,
    required this.kitchenProviders,
    required this.context,
    required this.productId,
    // required this.kitchenProvide
  }) : super(const KitchenState());
///.........this function is for protect if the internet is slow.  ກັນ error.............
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
      // ignore: unnecessary_brace_in_string_interps
      log('data loading===${data}');
      if (mounted) {
        emit(state.coppywith(status_c: statuslist.success, listOrder_c: data));
      }
    });
  }

//.........get order in kitchen to day...............
  Future<void> GetOrdeinkitchen() async {
 
      emit(state.coppywith(status_c: statuslist.loading));
    var result = await authenRepository.GetOrdeinkitchen();
    result!.fold((l) {
      log("Update status error $l");
    }, (data) {
        kitchenProviders.TogetgetOrderlist(data);
      
        emit(state.coppywith(status_c: statuslist.success,));
   
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
      Navigator.of(context).pop();
    MyProgress().loadingProgress(context: context,title: 'Updating');
    emit(state.coppywith(status_c: statuslist.loading));
    //await Future.delayed(const Duration(seconds: 1)); // ....here is to waiting time........

    var result = await authenRepository.getupdateTableStatus_OrderStatus(
        or_id: state.typeSeletOrderId!.orId,
        table_id: state.typeSeletOrderId!.tableId);
    result!.fold((l) {
      log("Update status error $l");
      Navigator.of(context).pop();
    }, (data) {

      Navigator.of(context).pop();
      SelectorderbyOrderStatus();
      emit(state.coppywith(status_c: statuslist.success));
    });
  }


rejectorder(value) async {
  productId = value;
  for (int i = 0; i < state.listOrderdetail!.length; i++) {
    if (productId == state.listOrderdetail![i].productId) {
      // // Convert OrderDetailModel to RejectModel
      // RejectModel rejectModel = state.listOrderdetail![i].toRejectModel();

      // // Call the method that requires RejectModel
      // kitchenProviders.TogetgetrejecModel(rejectModel);
      MyProgress().loadingProgress(
        context: context,
        title: 'ກໍາລັງດໍາເນີນການ'
      );

      await Future.delayed(const Duration(seconds: 1)); // Simulate waiting time
///......of post reject order to reject table.......
      emit(state.coppywith(status_c: statuslist.loading));
      var result = await authenRepository.postrejectOrder(
        orId: state.listOrderdetail![i].orId,
        ordId: state.listOrderdetail![i].ordId,
        pid: state.listOrderdetail![i].productId,
        qty: state.listOrderdetail![i].qty,
        amount:state.listOrderdetail![i].amount,
        table_id: state.listOrderdetail![i].tableId,
      );
      result!.fold(
        (l) {
          log("post status error $l");
          Navigator.of(context).pop();
        },
        (success) async {
          emit(state.coppywith(status_c: statuslist.success));
        },
      );

///......of reject order then delete in tborderdetail.......
      emit(state.coppywith(status_c: statuslist.loading));
      var results = await authenRepository.rejectOrder(
        orId: state.listOrderdetail![i].orId,
        pId: productId,
      );

      results!.fold(
        (l) {
          log("Update status error $l");
          Navigator.of(context).pop();
        },
        (success) async {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          await SelectorderbyOrderStatus(); // Ensure this completes before continuing
          SelectOrderdetail_kitchen(); // Refresh order details
          ontypeSelect(state.listOrder![i]); // Call after the above completes
          emit(state.coppywith(status_c: statuslist.success));
        },
      );

      return;
    }
  }
}


  billDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'ລາຍການສີນຄ້າ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.table_bar,
                        color: Colors.red,
                        size: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          state.typeSeletOrderId!.tableId.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                   
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Text("Date: " + _currentDateTime),
                    ],
                  ),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("ລ/ດ"),
                      Text("ຊື້ອາຫານ"),
                      Text("ຈໍານວນ "),
                      Text("ປະຕິເສດ "),
                    ],
                  ),
                ),
                const Divider(),
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
                                  IconButton(onPressed: (){
                                    ///....confirm dailog.....
                                     showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Confirm'),
                                              content: const Text(
                                                  'ຕ້ອງການປະຕິເສດແທ້ບໍ່?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('ບໍ່', style: TextStyle(color: Colors.red),),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(); // Close the dialog
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('ແມ່ນ'),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop();
                                                    rejectorder(state
                                                        .listOrderdetail![index]
                                                        .productId);
                                                     // Close the dialog
                                                    // Add your confirmation action here
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                  }, icon: const Icon(Icons.cancel, color: Colors.red,))
                                ],
                              ),
                            ),
                            const DottedLine(
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
                      const Text(
                        "ຈໍານວນທັງໝົດ:",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(state.typeSeletOrderId!.orQty.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        child: const Text('ຖ້າກ່ອນ', style: TextStyle(color: Colors.red),),
                        onPressed: () {
                          GetOrdeinkitchen();
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        child: const Text('ສໍາເລັດ',style: TextStyle(color: Colors.green)),
                        onPressed: () {
                          getupdateTableStatus_orStatus();
                          GetOrdeinkitchen();
                       //    Navigator.of(context).pop();
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
