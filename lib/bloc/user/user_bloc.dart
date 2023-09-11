import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:ralewayapp/models/user.dart';
import 'package:ralewayapp/repositories/repo_set/exception.dart';
import 'package:ralewayapp/repositories/user.dart';
import 'package:ralewayapp/utils/preferences.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    final client = http.Client();
    on<GetUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final user = await UserRepository.fetchUser(client);
        user.status = await Preferences.getUserStatus();
        emit(UserCompliedState(user: user));
      } on RepositoryException catch (exeption) {
        emit(UserFailedState(exception: exeption));
      } on Exception catch (exeption) {
        emit(UserFailedState(exception: exeption));
      }
    });

    on<LogOutUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        if (await Preferences.removeToken() &&
            await Preferences.removeUserStatus()) {
          emit(UserCompliedState(user: null));
        } else {
          emit(UserFailedState(exception: Exception("Cannot clear token")));
        }
      } on Exception catch (e) {
        emit(UserFailedState(exception: e));
      }
    });
  }
}
