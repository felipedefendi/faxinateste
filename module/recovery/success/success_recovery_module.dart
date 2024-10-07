import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/module/recovery/success/success_recovery.dart';

class SuccessRecoveryModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    [
      r.child('/', child: (context) => const SuccessRecovery()),
    ];
  }
}
