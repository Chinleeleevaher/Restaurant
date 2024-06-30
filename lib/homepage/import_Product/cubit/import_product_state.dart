part of 'import_product_cubit.dart';

enum OrderProductStatus { initial, loading, success, error }

class ImportProductState extends Equatable {
  const ImportProductState({
    this.status = OrderProductStatus.initial,
  });

  final OrderProductStatus status;
  @override
  List<Object> get props => [status];

  ImportProductState coppywith({
    OrderProductStatus? status_c,
  }) {
    return ImportProductState(
      status: status_c ?? this.status,
    );
  }
}

final class ImportProductInitial extends ImportProductState {}
