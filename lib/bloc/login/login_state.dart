part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginCompliedState extends LoginState {
  final LoginData loginData;
  LoginCompliedState({required this.loginData});
}

class LoginFailedState extends LoginState {
  final Exception? exception;
  LoginFailedState({this.exception});

  bool get isRepositoryException => exception is RepositoryException;

  RepositoryException get repositoryException =>
      exception as RepositoryException;

  bool get hasException => exception != null;

  bool hasError(String key) {
    return isRepositoryException && repositoryException.errors.containsKey(key);
  }

  String getError(String key) {
    if (isRepositoryException)
      return repositoryException.errors[key][0];
    else
      return "Not Repository Exception";
  }
}
