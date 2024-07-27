// ignore_for_file: camel_case_types, non_constant_identifier_names

part of 'menu_cubit.dart';

enum menuliststatuse { initial, loading, sucess, error }

class MenuState extends Equatable {
  const MenuState({
    this.listproductype = const [],
    this.listproduct = const [],
    this.status = menuliststatuse.initial,
    this.typeSelect,
  });
  final List<Producttype>? listproductype;
  final List<ProductModel>? listproduct;
  final menuliststatuse status;
  final Producttype? typeSelect;

  @override
  List<Object?> get props => [listproductype, status, listproduct, typeSelect];

  MenuState coppywith({
    List<Producttype>? listproductype_c,
    List<ProductModel>? listproduct_c,
    menuliststatuse? status_c,
    Producttype? typeSelect_c,
  }) {
    return MenuState(
      listproductype: listproductype_c ?? listproductype,
      listproduct: listproduct_c ?? listproduct,
      status: status_c ?? status,
      typeSelect: typeSelect_c ?? typeSelect,
    );
  }
}
