// ignore_for_file: non_constant_identifier_names, camel_case_types

part of 'products_cubit.dart';

enum productliststatuse { initial, loading, success, error }

class ProductsState extends Equatable {
  const ProductsState(
      {this.listproducttype = const [],
      // this.changecolor = Colors.white,
      this.listunit = const [],
      this.listproduct = const [],
      this.typeSelectproductItem,
      this.typeSelect,
      this.typeSelectunit,

      this.status = productliststatuse.initial});
  final List<Producttype>? listproducttype;
  final List<punit>? listunit;
  final List<ProductModel>? listproduct;
  final productliststatuse status;
  final Producttype? typeSelect;
  final punit? typeSelectunit;
  final ProductModel? typeSelectproductItem;
  //final Color? changecolor;

  @override
  List<Object?> get props => [
        listproducttype,
        listunit,
        status,
        typeSelect,
        typeSelectunit,
        listproduct,
        typeSelectproductItem,
      ];

  ProductsState coppywith(
      {List<Producttype>? listtabltype_c,
      List<ProductModel>? listtable_c,
      List<punit>? listunit_c,
      productliststatuse? status_c,
      Producttype? typeSelect_c,
      punit? typeSelectunit_c,
      ProductModel? typeSelectproductItem_c,
      String? product_id_c}) {
    return ProductsState(
      listproducttype: listtabltype_c ?? listproducttype,
      listunit: listunit_c ?? listunit,
      listproduct: listtable_c ?? listproduct,
      typeSelect: typeSelect_c ?? typeSelect,
      typeSelectunit: typeSelectunit_c ?? typeSelectunit,
      typeSelectproductItem:
          typeSelectproductItem_c ?? typeSelectproductItem,
      status: status_c ?? status,
      // changecolor: changecolor_c ?? this.changecolor,
    );
  }
}

final class ProductsInitial extends ProductsState {}
