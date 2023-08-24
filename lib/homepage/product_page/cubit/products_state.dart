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
      listproducttype: listtabltype_c ?? this.listproducttype,
      listunit: listunit_c ?? this.listunit,
      listproduct: listtable_c ?? this.listproduct,
      typeSelect: typeSelect_c ?? this.typeSelect,
      typeSelectunit: typeSelectunit_c ?? this.typeSelectunit,
      typeSelectproductItem:
          typeSelectproductItem_c ?? this.typeSelectproductItem,
      status: status_c ?? this.status,
      // changecolor: changecolor_c ?? this.changecolor,
    );
  }
}

final class ProductsInitial extends ProductsState {}
