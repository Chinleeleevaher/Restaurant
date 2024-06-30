import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthenRepository authenRepository;
  UserCubit({required this.authenRepository}) : super(UserState());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final status = TextEditingController();
  String? selectedRole;
  String? gender;

  //----of image picker----
  onTypeSelectimage(value) {
    emit(state.coppywith(typeSelecimage_c: value));
    //  adproduct();
  }
//......type collect role or staff..................
 onTypeSelectRole(value) {
    emit(state.coppywith(staff_c: value));
    
  }
  //......type collect gender..................
 onTypeSelectGender(value) {
    emit(state.coppywith(gender_c: value));
    
  }
  Future<void> addUser() async {
    emit(state.coppywith(status_c: addUserStatus.loading));
    var result = await authenRepository.addUser(
        image: state.typeSelecimage!.path,
        username: username.text,
        password: password.text,
        phone: phone.text,
        email: email.text,
        address: address.text,
        status: state.staff.toString(),
         gender: state.gender.toString());
    result!.fold(
      (f) {},
      (data) async {
        emit(state.coppywith(status_c: addUserStatus.success));
      },
    );
  }
}
