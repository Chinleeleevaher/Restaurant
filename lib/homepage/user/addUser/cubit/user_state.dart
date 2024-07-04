part of 'user_cubit.dart';

// ignore: camel_case_types
enum addUserStatus { initial, loading, success, error }

class UserState extends Equatable {
  const UserState(
      {
        this.addImage,
        this.updateImage,
       this.status = addUserStatus.initial,
       this.staff,
       this.gender,
      });
  final addUserStatus status;
  final File? addImage;
  final String? updateImage;
  final String? staff;
  final String? gender;

  @override
  List<Object?> get props => [status, addImage,updateImage, staff,gender];
  UserState coppywith(
      // ignore: non_constant_identifier_names
      {addUserStatus? status_c,
      // ignore: non_constant_identifier_names
      File? addImage_c,
      // ignore: non_constant_identifier_names
      String? updateImage_c,
      // ignore: non_constant_identifier_names
      final String? staff_c,
      // ignore: non_constant_identifier_names
      final String? gender_c,
      }) {
    return UserState(
      addImage: addImage_c ?? addImage,
      updateImage: updateImage_c ?? updateImage,
      staff: staff_c ?? staff,
      gender: gender_c ?? gender,
      status: status_c ?? status,
    );
  }
}
