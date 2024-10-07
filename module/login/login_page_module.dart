import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/module/login/controller/login_controller.dart';
import 'package:frontfaxina/app/module/login/login_page.dart';
import 'package:frontfaxina/app/service/login/login_service.dart';
import 'package:frontfaxina/app/service/login/login_service_impl.dart';

class LoginPageModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<LoginController>(LoginController.new);
    i.addLazySingleton<LoginService>(LoginServiceImpl.new);
  }

  @override
  void routes(r) {
    [
      r.child(
        '/',
        child: (context) => LoginFaxinaView(
          controller: Modular.get<LoginController>(),
        ),
      ),
    ];
  }
}
