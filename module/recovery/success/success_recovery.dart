import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/globals/elevatedButton_components.dart';
import 'package:frontfaxina/app/components/globals/texto_components.dart';

class SuccessRecovery extends StatefulWidget {
  const SuccessRecovery({super.key});

  @override
  State<SuccessRecovery> createState() => _SuccessRecoveryState();
}

class _SuccessRecoveryState extends State<SuccessRecovery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.check_circle,
                  size: 200,
                  color: Color(0xFF00AC47),
                ),
                MyCustomText(
                  'Senha Alterada!',
                  fontSize: 24,
                  color: Colors.black,
                ),
                const Text(
                  'Sua senha foi alterada com sucesso!',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 30),
                MyElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/login');
                  },
                  child: const Center(
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
