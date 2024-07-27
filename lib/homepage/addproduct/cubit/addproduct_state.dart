// ignore_for_file: non_constant_identifier_names, camel_case_types

part of 'addproduct_cubit.dart';

enum producttypestatuse { initial, loading, success, error }

class AddproductState extends Equatable {
  const AddproductState(
      {this.listproducttypes = const [],
      this.listunit = const [],
      this.typeSelect,
      this.typeSelecimage,
      this.typeSelectunit,
      this.imagenetword,
      this.status = producttypestatuse.initial});

  final List<Producttype>? listproducttypes;
  final List<punit>? listunit;
  final producttypestatuse status;
  final Producttype? typeSelect;
  final punit? typeSelectunit;
  final File? typeSelecimage;
  final String? imagenetword; // <--this is only for take image from product page to update page
  @override
  List<Object?> get props => [
        listproducttypes,
        listunit,
        status,
        typeSelect,
        typeSelectunit,
        typeSelecimage,
        imagenetword,
      ];
  AddproductState coppywith(
      {List<Producttype>? listtabltype_c,
      List<punit>? listunit_c,
      producttypestatuse? status_c,
      Producttype? typeSelect_c,
      punit? typeSelectunit_c,
      File? typeSelecimage_c,
      String? imagenetword_c,
      }) {
    return AddproductState(
      listproducttypes: listtabltype_c ?? listproducttypes,
      listunit: listunit_c ?? listunit,
      typeSelect: typeSelect_c ?? typeSelect,
      typeSelectunit: typeSelectunit_c ?? typeSelectunit,
      typeSelecimage: typeSelecimage_c ?? typeSelecimage,
      imagenetword: imagenetword_c ?? imagenetword,
      status: status_c ?? status,
    );
  }
}

final class AddproductInitial extends AddproductState {}
