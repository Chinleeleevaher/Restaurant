import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/homepage/user/getuser/getuserprovider.dart';
import 'package:myproject/homepage/user/model/getUserDetailModel.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:myproject/repository/authen_sipository.dart';
import 'package:provider/provider.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthenRepository authenRepository;
   BuildContext context;
  final getUserProvider userprovider;

  UserCubit({
    required this.authenRepository,
     required this.context,
    required this.userprovider,
 
  }) : super(UserState());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final status = TextEditingController();
  String? selectedRole;



  //----of image picker----
  onTypeSelectimage(value) {
    emit(state.coppywith(addImage_c: value));
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

  //.....upload image............
  Future<String?> uploadImageUser() async {
    String? imagename;
    try {
      emit(state.coppywith(status_c: addUserStatus.loading));
      var result =
          await authenRepository.userImage(imagepath: state.addImage!);
      result.fold(
        (f) {
          log('errro 101');
        },
        (data) {
          log('success ' + data.profileUrl.toString());
          print('data: $data');
          imagename = data.profileUrl; // <---here is ເຂົ້າຫາ list in the model
        },
      );
      return imagename;
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }

  // ..........add user...............
  Future<void> addUser() async {
    emit(state.coppywith(status_c: addUserStatus.loading));
    String? imagname = await uploadImageUser(); // <--is from above
    if (imagname == null) {
      return;
    }
    var result = await authenRepository.addUser(
        image: imagname,
        username: username.text,
        password: password.text,
        phone: phone.text,
        email: email.text,
        address: address.text,
        status: state.staff.toString(),
        gender: state.gender.toString());
    result!.fold(
      (f) {},
      (r) async {
        Fluttertoast.showToast(
            msg: "Upload sucessful", gravity: ToastGravity.CENTER);
        username.clear();
        password.clear();
        phone.clear();
        email.clear();
        address.clear();
        emit(state.coppywith(
            gender_c: "",
            staff_c: "",
            addImage_c: File(""),
            status_c: addUserStatus.success));
          Navigator.pop(context, true); 
      },
    );
  }
  // ..........update user...............
  Future<void> updateUser() async {
    MyProgress().loadingProgress(context: context);
    emit(state.coppywith(status_c: addUserStatus.loading));
    String? imagname = await uploadImageUser(); // <--is from above
    if (imagname == null) {
      imagname = state.updateImage;
    }
    var result = await authenRepository.updateUser( 
        uID: userprovider.getUserDetail!.uid,
        username: username.text, 
        image: imagname.toString(), 
        email: email.text, 
        phone: phone.text, 
        gender: state.gender.toString(), 
        address: address.text, 
        status: state.staff.toString(), 
        password:  password.text, 
      );
    result!.fold(
      (f) {},
      (r) async {

        username.clear();
        password.clear();
        phone.clear();
        email.clear();
        address.clear();
        emit(state.coppywith(
            gender_c: "Male",
            staff_c: "Admin",
            addImage_c: File(""),
            status_c: addUserStatus.success));
          userprovider.clearData();
          Navigator.pop(context, true); 
          Navigator.pop(context, true); 
      },
    );
  }


// to take data from the user page to update user
  userData() {
      username.text = userprovider.getUserDetail!.username;
     // password.text = userprovider.getUserDetail!.password;
      phone.text = userprovider.getUserDetail!.phone.toString();
      email.text = userprovider.getUserDetail!.email;
      address.text = userprovider.getUserDetail!.address;
       emit(state.coppywith(
        gender_c: userprovider.getUserDetail!.gender,
        staff_c: userprovider.getUserDetail!.status,
        updateImage_c: userprovider.getUserDetail!.image,
        
      ));
      
     
  }
}