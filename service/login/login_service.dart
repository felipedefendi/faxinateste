import 'package:frontfaxina/app/model/login_model.dart';

abstract class LoginService {
  Future<LoginModel> login(
    String email,
    String password,
  );
}
