import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontfaxina/app/model/login_model.dart';
import 'package:frontfaxina/app/service/login/login_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final LoginService _loginService;

  LoginController({required LoginService loginService})
      : _loginService = loginService,
        super(const LoginState.initial());

  Future<void> loginProgess(
      {required String email, required String password}) async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      await _loginService.login(email, password);

      emit(state.copyWith(status: LoginStatus.complete));
    } catch (e, s) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: "Erro no login - $s",
      ));
    }
  }
}
