part of 'category_cubit.dart';

enum Categorytatuse { initial, loading, success, error }

class CategoryState extends Equatable {
  const CategoryState({this.status = Categorytatuse.initial});

  final Categorytatuse status;

  @override
  List<Object> get props => [status];
  CategoryState coppywith({Categorytatuse? status_c}) {
    return CategoryState(status: status_c ?? this.status);
  }
}

final class CategoryInitial extends CategoryState {}
