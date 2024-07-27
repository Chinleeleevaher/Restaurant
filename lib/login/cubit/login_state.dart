


// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:myproject/model/loginmodel.dart';

enum liststatuse { initial, loading, success, error }

class CubitState extends Equatable {
  const CubitState( 
      {this.user = const [],
      this.status = liststatuse.initial,
      this.isEdit = false,
      this.rememberme = false,
      this.userEdit});

  final List<UserLoginModel>? user;
  final liststatuse status;
  final bool? isEdit;
  final UserLoginModel? userEdit;
  final bool? rememberme ;

  @override
  List<Object?> get props => [user, status,rememberme, isEdit, userEdit];

  CubitState copywith({
    List<UserLoginModel>? user_c,
    liststatuse? status_c,
    bool? isEditing_c,
    bool? rememberme_c,
    UserLoginModel? userEditing_c
  }) {
    return CubitState(
        user: user_c ?? user,
        status: status_c ?? status, // <--meaning muab qhab status_c coj los then rau statu. ?? yog hai thia qhab ntawm status_c tsi muaj ce kom rov qab los siv tu qhe default  status qub
        rememberme: rememberme_c ?? rememberme,
        isEdit: isEditing_c ?? isEdit,
        userEdit: userEditing_c ?? userEdit);
  }
}

