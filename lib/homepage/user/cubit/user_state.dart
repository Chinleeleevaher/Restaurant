part of 'user_cubit.dart';

enum addUserStatus { initial, loading, success, error }

class UserState extends Equatable {
  const UserState(
      {this.typeSelecimage, this.status = addUserStatus.initial,
       this.staff,
       this.gender,
      });
  final addUserStatus status;
  final File? typeSelecimage;
  final String? staff;
  final String? gender;

  @override
  List<Object?> get props => [status, typeSelecimage, staff,gender];
  UserState coppywith(
      {addUserStatus? status_c,
      File? typeSelecimage_c,
      final String? staff_c,
      final String? gender_c,
      }) {
    return UserState(
      typeSelecimage: typeSelecimage_c ?? this.typeSelecimage,
      staff: staff_c ?? this.staff,
      gender: gender_c ?? this.gender,
      status: status_c ?? this.status,
    );
  }
}
