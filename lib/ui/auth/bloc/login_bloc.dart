import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/model/api_models/api_status.dart';
import 'package:flutter_boilerplate/repository/login_repository.dart';
import 'package:get_it/get_it.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _loginRepository = GetIt.I<LoginRepository>();

  LoginBloc() : super(LoginState()) {
    on<PerformLoginEvent>(_performLogin);
  }

  void _performLogin(PerformLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginState(isLoading: true));
    final response = await _loginRepository.login(event.email, event.password);
    if (response.status == ApiStatus.success) {
      emit(LoginState(
        isCompleted: true,

      ));
    } else {
      emit(LoginState(error: response.error));
    }
  }

}
