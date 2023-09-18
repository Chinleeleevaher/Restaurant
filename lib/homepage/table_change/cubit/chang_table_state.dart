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
      listtabletype: listtabltype_c ?? this.listtabletype,
      listtable: listtable_c ?? this.listtable,
      typeSelect: typeSelect_c ?? this.typeSelect,
      status: status_c ?? this.status,
      fromtable: fromtable_c ?? this.fromtable,
      totable: totable_c ?? this.totable,
    );
  }
}

final class ChangTableInitial extends ChangTableState {}
