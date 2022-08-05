import 'package:beattheheat/cubit/app_cubit_states.dart';
import 'package:beattheheat/services/data_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required DataServices data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  void getData() {
    try {
      emit(LoadingState());
    } catch (e) {}
  }
}
