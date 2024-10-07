import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontfaxina/app/service/pin/pin_service.dart';

part 'register_code_state.dart';

class RegisterCodeController extends Cubit<RegisterCodeState> {
  final PinService _pinService;
  RegisterCodeController({required PinService pinService})
      : _pinService = pinService,
        super(const RegisterCodeState.initial());

  Future<void> verifyPinCodeProgress(
      {required String pinCode, required String email}) async {
    try {
      emit(state.copyWith(status: RegisterCodeStatus.loading));
      await _pinService.verifyPinCode(email, pinCode);

      emit(state.copyWith(status: RegisterCodeStatus.complete));
    } catch (e, s) {
      emit(state.copyWith(
        status: RegisterCodeStatus.failure,
        errorMessage: "Erro na validação do pin - $s",
      ));
    }
  }
}
