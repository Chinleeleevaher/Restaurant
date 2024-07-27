// ignore_for_file: non_constant_identifier_names, camel_case_types

part of 'get_user_cubit.dart';

enum getuserStatus { initial, loading, success, error }
 class GetUserState extends Equatable {
  const GetUserState({
    this.status = getuserStatus.initial
  });
  final getuserStatus status;
 @override
  List<Object?> get props => [status,];
  GetUserState coppywith(
      {getuserStatus? status_c,
     
      }) {
    return GetUserState(
      status: status_c ?? status,
    );
  }
}

final class GetUserInitial extends GetUserState {}
