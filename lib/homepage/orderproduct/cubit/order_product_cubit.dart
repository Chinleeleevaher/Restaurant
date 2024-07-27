// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/homepage/orderproduct/component/billDailog.dart';
import 'package:myproject/homepage/orderproduct/component/listDailog.dart';
import 'package:myproject/homepage/orderproduct/provider/orderProduct.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'order_product_state.dart';

class OrderProductCubit extends Cubit<OrderProductState> {
  final AuthenRepository authenRepository;
  final OrderProductProvider provider;
  final BuildContext context;
  OrderProductCubit({
    required this.authenRepository,
    required this.provider,
    required this.context,
  }) : super(const OrderProductState());
  //------ select Order product-------------------------
  Future<void> getOrderProdct() async {
    emit(state.coppywith(status_c: OrderProductStatus.loading));
    //  MyProgress().loadingProgress(context: context,title: 'Updating');
    // await Future.delayed(const Duration(seconds: 3)); // ....here is to waiting time........
    var result = await authenRepository.getOrder_Product();
    result!.fold((l) {
     // print("No data It is error");
    }, (r) {
      provider.TogetgetprodutOrdert(r);
      emit(state.coppywith(status_c: OrderProductStatus.success));
    });
  }

//increment
  ontype(value) {
    provider.collectQty(value);
  }

  //minus
  ontypeminus(value) {
    provider.minustQty(value);
  }

  String generateBillNumber() {
    // Create a random number generator
    Random random = Random();

    // Generate a random number between 0 and 9999
    int randomNumber = random.nextInt(10000);

    // Convert the number to a string and pad with leading zeros to ensure it's 4 digits long
    String billNumber = randomNumber.toString().padLeft(4, '0');
    PostOrderProduct(billNumber);
    return billNumber;
  }

  // ..........post order Product and make return.........................
  Future<void> PostOrderProduct(String billnumber) async {
    MyProgress().loadingProgress(
      context: context,
      title: 'ກໍາລັງເຮັດການສັ່ງຊື້',
    );
    await Future.delayed(const Duration(seconds: 1));
    for (int i = 0; i < provider.getproductOrder!.length; i++) {
      if (provider.getproductOrder![i].quantity != 0) {
        emit(state.coppywith(status_c: OrderProductStatus.loading));
        var result = await authenRepository.PostOrderProduct(
            product_id: provider.getproductOrder![i].productId,
            product_name: provider.getproductOrder![i].productName,
            product_Qty: provider.getproductOrder![i].quantity,
            product_price: provider.getproductOrder![i].price,
            product_cost: provider.getproductOrder![i].cost,
            product_image: provider.getproductOrder![i].image,
            billNumber: billnumber);
        result!.fold((l) {
          emit(state.coppywith(status_c: OrderProductStatus.error));
        }, (data) {
          provider.ToCollectprodutOrdert(data);
          
          emit(state.coppywith(status_c: OrderProductStatus.loading));
          // billDialog();
        });
      }
    }
    Navigator.of(context).pop();
    orderPrintDailog(context)
   .then((value) => UpdateOrderProduct());
    getOrderProdct();
    Fluttertoast.showToast(
      msg: "ສໍາເລັດ",
      gravity: ToastGravity.CENTER,
    );
  }

  //.........update order product............
  //------ select Order product-------------------------
  Future<void> UpdateOrderProduct() async {
    for (int i = 0; i < provider.collectproductOrder!.length; i++) {
      emit(state.coppywith(status_c: OrderProductStatus.loading));
      var result = await authenRepository.UpdateOrderProduct(
          productID: provider.collectproductOrder![i].productId.toString());
      result!.fold((l) {}, (r) {
        emit(state.coppywith(status_c: OrderProductStatus.success));
      });
    }
  }

  //------ select Order product for list bill-------------------------
  Future<void> orderProductListBill() async {
    emit(state.coppywith(status_c: OrderProductStatus.loading));
    var result = await authenRepository.orderProductListBill();
    result!.fold((l) {}, (data) {
      provider.togetproductListBill(data);
      emit(state.coppywith(status_c: OrderProductStatus.success));
    });
  }

  //........to type bill number to select order product to make bill.....
  ontypeselectBillid(value) {
    opBillId(value);
  }

  //------ select Order product for list bill by bill number-------------------------
  Future<void> opBillId(String value) async {
     provider.productListBillNumber!.clear();
      MyProgress().loadingProgress(
      context: context,
      title: 'Loading',
    );
     await Future.delayed(const Duration(seconds: 1));
    emit(state.coppywith(status_c: OrderProductStatus.loading));
    var result = await authenRepository.opBillId(BillNumber: value);
    result!.fold((l) {}, (data) {
      provider.togetproductBillNumber(data);
      emit(state.coppywith(status_c: OrderProductStatus.success));
    });
     Navigator.of(context).pop();
     listdailog(context);
  }
}
