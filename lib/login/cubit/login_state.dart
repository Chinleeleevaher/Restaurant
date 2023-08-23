


import 'package:equatable/equatable.dart';
import 'package:myproject/model/loginmodel.dart';

enum liststatuse { initial, loading, success, error }

class CubitState extends Equatable {
  const CubitState(
      {this.user = const [],
      this.status = liststatuse.initial,
      this.isEdit = false,
      this.userEdit});

  final List<UserLoginModel>? user;
  final liststatuse status;
  final bool? isEdit;
  final UserLoginModel? userEdit;

  @override
  List<Object?> get props => [user, status, isEdit, userEdit];

  CubitState copywith({
    List<UserLoginModel>? user_c,
    liststatuse? status_c,
    bool? isEditing_c,
    UserLoginModel? userEditing_c,
  }) {
    return CubitState(
        user: user_c ?? this.user,
        status: status_c ?? this.status,
        isEdit: isEditing_c ?? this.isEdit,
        userEdit: userEditing_c ?? this.userEdit);
  }
}

