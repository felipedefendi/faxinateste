import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/module/register/register_birthdate/register_birthdate_view.dart';

class RegisterBirthdateModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    [
      r.child('/', child: (context) => const RegisterBirthdateView()),
    ];
  }
}
