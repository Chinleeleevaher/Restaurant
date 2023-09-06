part of 'orderstatus_cubit.dart';

enum selectorderdata { initial, loading, success, error }

class OrderstatusState extends Equatable {
  const OrderstatusState({
    this.status = selectorderdata.initial,
    this.error,
    });

  final selectorderdata status;
  final String? error;

  @override
  List<Object?> get props => [status, error];

  OrderstatusState coppywith({
    selectorderdata? status_c,
    String? error_c
    }) {
    return OrderstatusState(
      error: error_c?? this.error,
      status: status_c ?? this.status
      );
  }
}

final class OrderstatusInitial extends OrderstatusState {}
