import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/homepage/import_Product/provider/provider.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'import_product_state.dart';

class ImportProductCubit extends Cubit<ImportProductState> {
  final AuthenRepository authenRepository;
  final ImpProduct providers;
   final BuildContext context;
  ImportProductCubit({
    required this.authenRepository,
    required this.providers,
    required this.context,
  }) : super(ImportProductState());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final BillNumber = TextEditingController();
  final ProductName = TextEditingController();
  final SalePriceProduct = TextEditingController();
  final BuyPriceProduct = TextEditingController();
  final ScanProdutId = TextEditingController();
  final NameProduct = TextEditingController();
  final ProductQty = TextEditingController();
 // var _productQtyController = TextEditingController();

  // ..........post order Product and make return.........................
  Future<void> selectOrderporduct() async {
    emit(state.coppywith(status_c: OrderProductStatus.loading));
    
    var result =
        await authenRepository.selectOrderporduct(
          BillNumber: BillNumber.text
          );
    result!.fold((l) {
      ProductName.clear();
      ProductQty.clear();
      BuyPriceProduct.clear();
    }, (data) {
      providers.setImportProduct(data);
      // ProductName.text = providers.getImportProduct.orpName ;
      // ProductQty.text = providers.getImportProduct.orpQty.toString();
      // BuyPriceProduct.text = providers.getImportProduct.orpPrice.toString();
      emit(state.coppywith(status_c: OrderProductStatus.success));
    });
  }

  // ..........update tbProduct quantity from import product.........................
  Future<void> updateproductquantity() async {
     MyProgress().loadingProgress(
      context: context,
      title: 'ກໍາລັງນໍາເຂົ້າ',
    );
     await Future.delayed(const Duration(seconds: 1));
    emit(state.coppywith(status_c: OrderProductStatus.loading));
    for(int i = 0; i < providers.getImportProduct!.length; i++){
       var result = await authenRepository.updateProductImport(
        product_id: providers.getImportProduct![i].productId,
        quantity: int.parse(providers.getImportProduct![i].orpQtyController.text),
         billnumber: BillNumber.text
        );

    result!.fold((l) {}, (r) {
    });
    }
     BillNumber.clear();
       providers.getImportProduct!.clear();
       emit(state.coppywith(status_c: OrderProductStatus.success));
    Navigator.of(context).pop();
    Fluttertoast.showToast(
      msg: "ນໍາເຂົ້າສໍາເລັດ",
      gravity: ToastGravity.CENTER,
    );
  }
}
