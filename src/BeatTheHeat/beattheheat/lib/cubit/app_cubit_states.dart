import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  late int x;
  @override
  List<Object?> get props => [x];
}

class WelcomeState extends CubitStates {
  @override
  List<Object?> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  @override
  List<Object> get props => [];
}
