import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/module/register/register_cpf/register_cpf_view.dart';

class RegisterCpfModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    [
      r.child('/', child: (context) => const RegisterCpfView()),
    ];
  }
}
