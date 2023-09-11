part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterUpdateState extends RegisterState {}

class RegisterComplitedState extends RegisterState {}

class RegisterFailedState extends RegisterState {
  final int? errorCode;
  final Exception? error;

  RegisterFailedState({this.errorCode, this.error});
}
