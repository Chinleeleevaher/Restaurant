// ignore_for_file: camel_case_types, non_constant_identifier_names

part of 'lisproduct_cubit.dart';

enum listproduct_status { initial, loading, sucess, error }

class LisproductState extends Equatable {
  const LisproductState( {
    this.orderproduct,
    this.listproductype = const [],
    this.listproduct = const [],
    this.status = listproduct_status.initial,
    this.typeSelect,
  });
  final List<Producttype>? listproductype;
  final List<ProductModel>? listproduct;
  final listproduct_status status;
  final Producttype? typeSelect;
  final OrderproductModel? orderproduct;
  @override
  List<Object?> get props => [listproductype, status, listproduct, typeSelect,orderproduct];

  LisproductState coppywith({
    List<Producttype>? listproductype_c,
    List<ProductModel>? listproduct_c,
    listproduct_status? status_c,
    Producttype? typeSelect_c,
    OrderproductModel? orderproduct_c,
  }) {
    return LisproductState(
      listproductype: listproductype_c ?? listproductype,
      listproduct: listproduct_c ?? listproduct,
      status: status_c ?? status,
      typeSelect: typeSelect_c ?? typeSelect,
      orderproduct: orderproduct_c ?? orderproduct,
    );
  }
}

final class LisproductInitial extends LisproductState {}
