// ignore_for_file: camel_case_types, non_constant_identifier_names, unnecessary_this

part of 'checkbill_cubit.dart';

enum statuslist { initial, loading, success, error }

class CheckbillState extends Equatable {
  const CheckbillState({this.status = statuslist.initial});

  final statuslist status;
  @override
  List<Object> get props => [status];
  CheckbillState coppywith({statuslist? status_c}) {
    return CheckbillState(status: status_c ?? this.status);
  }
}

final class CheckbillInitial extends CheckbillState {}
