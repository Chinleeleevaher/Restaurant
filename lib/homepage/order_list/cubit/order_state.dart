// ignore_for_file: non_constant_identifier_names, camel_case_types

part of 'order_cubit.dart';

enum orderproductstatuse { initial, loading, success, error }

class OrderState extends Equatable {
  const OrderState({
    this.or_amount,
    this.or_qty,
    this.or_table,
    this.or_status,
    this.or_datetime,
    this.status = orderproductstatuse.initial,
  });

  final int? or_amount;
  final int? or_qty;
  final int? or_table;
  final bool? or_status;
  final DateTime? or_datetime;
  final orderproductstatuse status;


  @override
  List<Object?> get props =>
      [or_amount, or_qty, or_table, or_status, or_datetime, status];

  OrderState coppywith(
      {
      int? or_amount_c,
      int? or_qty_c,
      int? or_table_c,
      bool? or_status_c,
      orderproductstatuse? status_c,
      DateTime? or_datime_c}) {
    return OrderState(
      or_amount: or_amount_c ?? or_amount,
      or_qty: or_qty_c ?? or_qty,
      or_table: or_table_c ?? or_table,
      or_status: or_status_c ?? or_status,
      or_datetime: or_datime_c ?? or_datetime,
      status: status_c ?? status,
    );
  }
}

final class OrderInitial extends OrderState {}
