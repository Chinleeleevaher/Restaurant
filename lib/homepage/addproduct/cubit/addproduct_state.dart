part of 'addproduct_cubit.dart';
enum producttypestatuse { initial, loading, success, error }
 class AddproductState extends Equatable {
  const AddproductState(
       {
      this.listproducttypes = const [],
      this.listunit = const [],
      this.typeSelect,
      this.typeSelecimage,
      this.typeSelectunit,
      this.imagenetword,
      this.status = producttypestatuse.initial}
  );

  final List<Producttype>? listproducttypes;
  final List<punit>? listunit;
  final producttypestatuse status;
  final Producttype? typeSelect;
  final punit? typeSelectunit;
  final File? typeSelecimage;
  final String? imagenetword;
  @override
  List<Object?> get props => [
       listproducttypes,
        listunit,
        status,
        typeSelect,
        typeSelectunit,
        typeSelecimage,
        imagenetword
  ];
    AddproductState coppywith({
    List<Producttype>? listtabltype_c,
    List<punit>? listunit_c,
    producttypestatuse? status_c,
    Producttype? typeSelect_c,
    punit? typeSelectunit_c,
    File? typeSelecimage_c,
    String? imagenetword_c
    // Color? changecolor_c
  }) {
    return AddproductState(
      listproducttypes: listtabltype_c ?? this.listproducttypes,
      listunit: listunit_c ?? this.listunit,
      typeSelect: typeSelect_c ?? this.typeSelect,
      typeSelectunit: typeSelectunit_c ?? this.typeSelectunit,
      typeSelecimage: typeSelecimage_c ?? this.typeSelecimage,
      imagenetword: imagenetword_c ?? this.imagenetword,
      status: status_c ?? this.status,
    );
  }
}

final class AddproductInitial extends AddproductState {}
