part of 'orderstatus_cubit.dart';

enum selectorderdata { initial, loading, success, error }

class OrderstatusState extends Equatable {
  const OrderstatusState({
    this.status = selectorderdata.initial,
    this.error,
    this.selectOrderList = const [],
  });

  final selectorderdata status;
  final String? error;
  final List<SelectOrderByTableModel>? selectOrderList;

  @override
  List<Object?> get props => [
        status,
        error,
        selectOrderList,
      ];

  OrderstatusState coppywith({
    selectorderdata? status,
    String? error,
    List<SelectOrderByTableModel>? selectOrderList,
  }) {
    return OrderstatusState(
      error: error ?? this.error,
      status: status ?? this.status,
      selectOrderList: selectOrderList ?? this.selectOrderList,
    );
  }
}

final class OrderstatusInitial extends OrderstatusState {}
