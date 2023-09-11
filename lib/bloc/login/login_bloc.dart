import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:ralewayapp/models/login_data.dart';
import 'package:ralewayapp/repositories/auth.dart';
import 'package:ralewayapp/repositories/repo_set/exception.dart';
import 'package:ralewayapp/utils/logger.dart';
import 'package:ralewayapp/utils/preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    final client = http.Client();

    on<LoginUserEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        final loginData = await AuthRepository.login(client, event.data);

        if (loginData.token != null &&
            await Preferences.setToken(loginData.token!)) {
          await Preferences.setUserStatus(loginData.status ?? false);
          emit(LoginCompliedState(loginData: loginData));
          logger.d('token saved');
        } else {
          logger.d('token cannot be saved');
          emit(LoginFailedState(exception: Exception("Cannot save token")));
        }
      } on RepositoryException catch (exeption) {
        emit(LoginFailedState(exception: exeption));
      } on Exception catch (e) {
        emit(LoginFailedState(exception: e));
      }
    });
  }
}
