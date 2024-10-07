import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/module/recovery/forgot_password_view.dart';
import 'package:frontfaxina/app/module/recovery/recovery_password/recovery_password_module.dart';

class LoginPageModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    [
      r.child('/', child: (context) => const ForgotPasswordView()),
      ModuleRoute('/password', module: RecoveryPasswordModule()),
      ModuleRoute('/register', module: RecoveryPasswordModule()),
    ];
  }
}
