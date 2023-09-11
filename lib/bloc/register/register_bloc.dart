import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:ralewayapp/repositories/auth.dart';
import 'package:ralewayapp/repositories/repo_set/exception.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState()) {
    final client = http.Client();
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        await AuthRepository.register(client, event.data);

        emit(RegisterComplitedState());
      } on RepositoryException catch (exp) {
        emit(RegisterFailedState(error: exp, errorCode: 4));
      } on Exception catch (e) {
        emit(RegisterFailedState(error: e, errorCode: 0));
      }
    });
  }
}
