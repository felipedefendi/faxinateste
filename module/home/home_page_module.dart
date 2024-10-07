import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/module/home/home_view.dart';

class HomePageModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    [
      r.child('/', child: (context) => const HomeView()),
    ];
  }
}
