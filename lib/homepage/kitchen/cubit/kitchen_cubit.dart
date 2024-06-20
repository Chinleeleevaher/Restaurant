import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'kitchen_state.dart';

class KitchenCubit extends Cubit<KitchenState> {
  KitchenCubit() : super(KitchenInitial());
}
