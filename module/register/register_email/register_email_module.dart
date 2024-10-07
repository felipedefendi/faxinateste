import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/module/register/register_email/controller/register_email_controller.dart';
import 'package:frontfaxina/app/module/register/register_email/register_email_view.dart';
import 'package:frontfaxina/app/service/verifyEmail/verify_email_service.dart';
import 'package:frontfaxina/app/service/verifyEmail/verify_email_service_impl.dart';

class RegisterEmailModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<RegisterEmailController>(RegisterEmailController.new);
    i.addLazySingleton<VerifyEmailService>(VerifyEmailServiceImpl.new);
  }

  @override
  void routes(r) {
    [
      r.child('/',
          child: (context) => RegisterEmailView(
                controller: Modular.get<RegisterEmailController>(),
              )),
    ];
  }
}
