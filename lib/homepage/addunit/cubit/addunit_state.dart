// ignore_for_file: camel_case_types, non_constant_identifier_names

part of 'addunit_cubit.dart';

enum unitstatuse { initial, loading, success, error }
 class AddunitState extends Equatable {
  const AddunitState(
    {this.status = unitstatuse.initial}
  );


  final unitstatuse status;
  @override
  List<Object> get props => [status];
    AddunitState coppywith({unitstatuse? status_c}) {
    return AddunitState(status: status_c ?? status);
  }
}

final class AddunitInitial extends AddunitState {}
