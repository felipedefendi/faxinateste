import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/module/firstTime/first_time_view_module.dart';
import 'package:frontfaxina/app/module/home/home_page_module.dart';
import 'package:frontfaxina/app/module/login/controller/login_controller.dart';
import 'package:frontfaxina/app/module/login/login_page.dart';
import 'package:frontfaxina/app/module/register/register_faxina_module.dart';
import 'package:frontfaxina/app/service/addresses/addresses_service.dart';
import 'package:frontfaxina/app/service/addresses/addresses_service_impl.dart';
import 'package:frontfaxina/app/service/feed/feed_service.dart';
import 'package:frontfaxina/app/service/feed/feed_service_impl.dart';
import 'package:frontfaxina/app/service/login/login_service.dart';
import 'package:frontfaxina/app/service/login/login_service_impl.dart';
import 'package:frontfaxina/app/service/pin/pin_service.dart';
import 'package:frontfaxina/app/service/pin/pin_service_impl.dart';
import 'package:frontfaxina/app/service/recovery/recovery_service.dart';
import 'package:frontfaxina/app/service/recovery/recovery_service_impl.dart';
import 'package:frontfaxina/app/service/register/register_service.dart';
import 'package:frontfaxina/app/service/register/register_service_impl.dart';
import 'package:frontfaxina/app/service/verifyEmail/verify_email_service.dart';
import 'package:frontfaxina/app/service/verifyEmail/verify_email_service_impl.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<LoginController>(LoginController.new);
    i.addLazySingleton<LoginService>(LoginServiceImpl.new);
    i.addLazySingleton<AddressesService>(AddressesServiceImpl.new);
    i.addLazySingleton<FeedService>(FeedServiceImpl.new);
    i.addLazySingleton<PinService>(PinServiceImpl.new);
    i.addLazySingleton<RecoveryService>(RecoveryServiceImpl.new);
    i.addLazySingleton<RegisterService>(RegisterServiceImpl.new);
    i.addLazySingleton<VerifyEmailService>(VerifyEmailServiceImpl.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => LoginFaxinaView(
        controller: Modular.get<LoginController>(),
      ),
    );
    r.module('/register', module: RegisterFaxinaModule());
    r.module('/recovery', module: FirstTimeViewModule());
    r.module('/firsttime', module: FirstTimeViewModule());
    r.module('/home', module: HomePageModule());
    r.module('/profile', module: FirstTimeViewModule());
  }
}
