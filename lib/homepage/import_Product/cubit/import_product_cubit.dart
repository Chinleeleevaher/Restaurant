import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/homepage/import_Product/provider/provider.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'import_product_state.dart';

class ImportProductCubit extends Cubit<ImportProductState> {
  final AuthenRepository authenRepository;
  final ImpProduct providers;

  ImportProductCubit({
    required this.authenRepository,
    required this.providers,
  }) : super(ImportProductState());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final ProdcutId = TextEditingController();
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
          product_id: ProdcutId.text
          );
    result!.fold((l) {
      ProductName.clear();
      ProductQty.clear();
      BuyPriceProduct.clear();
    }, (data) {
      providers.setImportProduct(data);
      ProductName.text = providers.getImportProduct.orpName;
      ProductQty.text = providers.getImportProduct.orpQty.toString();
      BuyPriceProduct.text = providers.getImportProduct.orpPrice.toString();
      emit(state.coppywith(status_c: OrderProductStatus.success));
    });
  }

  // ..........update tbProduct quantity from import product.........................
  Future<void> updateproductquantity() async {
    emit(state.coppywith(status_c: OrderProductStatus.loading));
    var result = await authenRepository.updateProductImport(
        product_id: ProdcutId.text, quantity: int.parse(ProductQty.text));
    result!.fold((l) {}, (r) {
      ProdcutId.clear();
      ProductName.clear();
      ProductQty.clear();
      BuyPriceProduct.clear();
      
      emit(state.coppywith(status_c: OrderProductStatus.success));
    });
  }
}
