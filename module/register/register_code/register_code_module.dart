import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/module/register/register_code/controller/register_code_controller.dart';
import 'package:frontfaxina/app/module/register/register_code/register_code_view.dart';
import 'package:frontfaxina/app/service/pin/pin_service.dart';
import 'package:frontfaxina/app/service/pin/pin_service_impl.dart';

class RegisterCodeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<RegisterCodeController>(RegisterCodeController.new);
    i.addLazySingleton<PinService>(PinServiceImpl.new);
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => RegisterCodeScreen(
              controller: Modular.get<RegisterCodeController>(),
            ));
  }
}
