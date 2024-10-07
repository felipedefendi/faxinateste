import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/module/firstTime/first_time_view.dart';

class FirstTimeViewModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    [
      r.child('/', child: (context) => const FirstTimePage()),
    ];
  }
}
