import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'checkbill_state.dart';

class CheckbillCubit extends Cubit<CheckbillState> {
  CheckbillCubit() : super(CheckbillInitial());
}
