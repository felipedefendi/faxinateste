import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/module/recovery/recovery_password/recovery_password.dart';

class RecoveryPasswordModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    [
      r.child('/', child: (context) => const RecoveryPassword()),
    ];
  }
}
