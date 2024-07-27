// ignore_for_file: non_constant_identifier_names

part of 'category_cubit.dart';

enum Categorytatuse { initial, loading, success, error }

class CategoryState extends Equatable {
  const CategoryState({this.status = Categorytatuse.initial});

  final Categorytatuse status;

  @override
  List<Object?> get props => [status];
  CategoryState coppywith({Categorytatuse? status_c}) {
    return CategoryState(status: status_c ?? status);
  }
}
