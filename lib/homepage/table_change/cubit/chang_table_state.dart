// ignore_for_file: camel_case_types, non_constant_identifier_names

part of 'chang_table_cubit.dart';

enum tableliststatuse { initial, loading, success, error }

class ChangTableState extends Equatable {
  const ChangTableState(
      {this.listtabletype = const [],
      this.listtable = const [],
      this.typeSelect,
      this.fromtable,
      this.totable,
      this.status = tableliststatuse.initial});
  final List<Tabletype>? listtabletype;
  final List<Tables>? listtable;
  final tableliststatuse status;
  final Tabletype? typeSelect;
  final SelectOrderByTableModel? fromtable;
  final SelectOrderByTableModel? totable;
  @override
  List<Object?> get props => [
        listtabletype,
        status,
        typeSelect,
        listtable,
        fromtable,
        totable
      ];

  ChangTableState coppywith(
      {List<Tabletype>? listtabltype_c,
      List<Tables>? listtable_c,
      tableliststatuse? status_c,
      Tabletype? typeSelect_c,
      Tables? ordertablelist_c,
      SelectOrderByTableModel? fromtable_c,
      SelectOrderByTableModel? totable_c,
      }) {
    return ChangTableState(
      listtabletype: listtabltype_c ?? listtabletype,
      listtable: listtable_c ?? listtable,
      typeSelect: typeSelect_c ?? typeSelect,
      status: status_c ?? status,
      fromtable: fromtable_c ?? fromtable,
      totable: totable_c ?? totable,
    );
  }
}

final class ChangTableInitial extends ChangTableState {}
