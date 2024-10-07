import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/module/recovery/code_screen/recovey_code_screen.dart';

class ForgotCodeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    [
      r.child('/', child: (context) => const RecoveyCodeScreen()),
    ];
  }
}
