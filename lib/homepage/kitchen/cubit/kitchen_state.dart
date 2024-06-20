part of 'kitchen_cubit.dart';

sealed class KitchenState extends Equatable {
  const KitchenState();

  @override
  List<Object> get props => [];
}

final class KitchenInitial extends KitchenState {}
