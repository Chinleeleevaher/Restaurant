// ignore_for_file: camel_case_types, non_constant_identifier_names

part of 'addtable_cubit.dart';

enum tablestatuse { initial, loading, success, error }
 class AddtableState extends Equatable {
  const AddtableState({
    this.status = tablestatuse.initial,
    this.tableType = 0

    });

 final tablestatuse status;
 final int  tableType;
   @override
  List<Object> get props => [status,tableType];
    AddtableState coppywith({
      tablestatuse? status_c,
      int? tableType_c
      }) {
    return AddtableState(
      status: status_c ?? status,
      tableType: tableType_c ?? tableType,
      );
  }
 }