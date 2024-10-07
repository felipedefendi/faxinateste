import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontfaxina/app/app_module.dart';
import 'package:frontfaxina/app/app_widget.dart';

const storage = FlutterSecureStorage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
