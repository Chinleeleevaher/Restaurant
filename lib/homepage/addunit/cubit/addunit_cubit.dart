import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'addunit_state.dart';

class AddunitCubit extends Cubit<AddunitState> {
  AddunitCubit() : super(AddunitState());
}
