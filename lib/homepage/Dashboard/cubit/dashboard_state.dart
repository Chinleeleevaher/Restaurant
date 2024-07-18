part of 'dashboard_cubit.dart';


enum dashBoardstatus { initail, loading, success, error }
 class DashboardState extends Equatable {
  DashboardState({
    this.status = dashBoardstatus.initail,
  });
  final dashBoardstatus status;
   @override
  List<Object?> get props => [status];

  DashboardState coppywith(
      {dashBoardstatus? status,
   
      }) {
    return DashboardState(
      status: status ?? this.status,

    );
  }
}

final class DashboardInitial extends DashboardState {}
