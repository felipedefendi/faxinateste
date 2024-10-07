import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontfaxina/app/service/verifyEmail/verify_email_service.dart';

part 'register_email_state.dart';

class RegisterEmailController extends Cubit<RegisterEmailState> {
  final VerifyEmailService _verifyEmailService;

  RegisterEmailController({required VerifyEmailService verifyEmailService})
      : _verifyEmailService = verifyEmailService,
        super(const RegisterEmailState.initial());

  Future<void> verifyEmailProgress({required String email}) async {
    try {
      emit(state.copyWith(status: RegisterEmailStatus.loading));
      await _verifyEmailService.sendMailValidation(email);
      emit(state.copyWith(status: RegisterEmailStatus.complete));
    } catch (e, s) {
      emit(state.copyWith(
        status: RegisterEmailStatus.failure,
        errorMessage: "Erro no cadastro de email - $s",
      ));
    }
  }
}
