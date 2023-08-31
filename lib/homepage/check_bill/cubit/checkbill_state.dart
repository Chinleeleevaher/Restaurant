part of 'checkbill_cubit.dart';

sealed class CheckbillState extends Equatable {
  const CheckbillState();

  @override
  List<Object> get props => [];
}

final class CheckbillInitial extends CheckbillState {}
