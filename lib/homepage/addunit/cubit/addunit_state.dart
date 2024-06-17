part of 'addunit_cubit.dart';

enum unitstatuse { initial, loading, success, error }
 class AddunitState extends Equatable {
  const AddunitState(
    {this.status = unitstatuse.initial}
  );


  final unitstatuse status;
  @override
  List<Object> get props => [status];
    AddunitState coppywith({unitstatuse? status_c}) {
    return AddunitState(status: status_c ?? this.status);
  }
}

final class AddunitInitial extends AddunitState {}
