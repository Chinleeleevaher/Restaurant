
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myproject/homepage/user/getuser/getuserprovider.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
    final AuthenRepository authenRepository;
  final getUserProvider userprovider;
  GetUserCubit({
        required this.authenRepository,
    required this.userprovider,
  }) : super(const GetUserState());

    //..........get user.......................

  Future<void> getuser() async {

    emit(state.coppywith(status_c: getuserStatus.loading));
    var result = await authenRepository.getUser();
    result!.fold(
      (f) {
     
      },
      (data){
       userprovider.TogetgetUser(data);
        emit(state.coppywith(status_c: getuserStatus.success));
      },
    );
  }

  //.....select user id for loop and show in the user detail...........
  ontyeSelectUser(value){
  userprovider.getSelectUserID(value);
  }

      //..........delete user.......................

  Future<void> deleteUser() async {

    emit(state.coppywith(status_c: getuserStatus.loading));
    var result = await authenRepository.deleteUser(
      uID: userprovider.getUserID
      );
    result!.fold(
      (f) {
    
      },
      (r){
        emit(state.coppywith(status_c: getuserStatus.success));
       
      },
    );
  }

  
}
