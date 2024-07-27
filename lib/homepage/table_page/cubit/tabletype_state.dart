// ignore_for_file: camel_case_types, non_constant_identifier_names

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
  List<Object?> get props => [listtabletype, status, typeSelect,listtable,];

  TabletypeState coppywith(
      {List<Tabletype>? listtabltype_c,
      List<Tables>? listtable_c,
      tableliststatuse? status_c,
      Tabletype? typeSelect_c ,
     Tables? ordertablelist_c
      }) {
    return TabletypeState(
      listtabletype: listtabltype_c ?? listtabletype,
      listtable: listtable_c ?? listtable,
      typeSelect: typeSelect_c?? typeSelect,
      status: status_c ?? status,
    );
  }
}

final class TabletypeInitial extends TabletypeState {}
