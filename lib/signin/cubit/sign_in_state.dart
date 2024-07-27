// ignore_for_file: camel_case_types, non_constant_identifier_names

part of 'sign_in_cubit.dart';

enum statuslist { initial, loading, success, error }

class SignInState extends Equatable {
  const SignInState({this.status = statuslist.initial});
  final statuslist status;
  @override
  List<Object> get props => [status];

  SignInState coppywith({statuslist? status_c, required String message}) {
    return SignInState(
      status: status_c?? status
    );
  }
}

class SignInInitial extends SignInState {}
