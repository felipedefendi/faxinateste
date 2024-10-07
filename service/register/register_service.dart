import 'package:frontfaxina/app/model/client_register_model.dart';

abstract class RegisterService {
  Future<ClientRegisterModel> register(
    final ClientRegisterModel clientRegisterModel,
  );
}
