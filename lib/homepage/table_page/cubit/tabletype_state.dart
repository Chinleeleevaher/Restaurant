part of 'tabletype_cubit.dart';

enum tableliststatuse { initial, loading, success, error }

class TabletypeState extends Equatable {
  const TabletypeState(
      {this.listtabletype = const [],
      this.listtable = const [],
      this.typeSelect,
      this.status = tableliststatuse.initial});

  final List<Tabletype>? listtabletype;
  final List<Tables>? listtable;
  final tableliststatuse status;
  final Tabletype? typeSelect;
  @override
  List<Object?> get props => [listtabletype, status, typeSelect,listtable];

  TabletypeState coppywith(
      {List<Tabletype>? listtabltype_c,
      List<Tables>? listtable_c,
      tableliststatuse? status_c,
      Tabletype? typeSelect_c
      }) {
    return TabletypeState(
      listtabletype: listtabltype_c ?? this.listtabletype,
      listtable: listtable_c ?? this.listtable,
      typeSelect: typeSelect_c?? this.typeSelect,
      status: status_c ?? this.status,
    );
  }
}

final class TabletypeInitial extends TabletypeState {}
