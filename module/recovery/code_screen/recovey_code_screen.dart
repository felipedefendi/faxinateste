import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/globals/elevatedButton_components.dart';
import 'package:frontfaxina/app/components/globals/iconButton_componentes.dart';
import 'package:frontfaxina/app/components/globals/pin_code_field_components.dart';
import 'package:frontfaxina/app/components/globals/texto_components.dart';
import 'package:frontfaxina/app/module/recovery/recovery_password/recovery_password.dart';

class RecoveyCodeScreen extends StatefulWidget {
  const RecoveyCodeScreen({super.key});

  @override
  State<RecoveyCodeScreen> createState() => _RecoveyCodeScreenState();
}

class _RecoveyCodeScreenState extends State<RecoveyCodeScreen> {
  String? pinCodeController = "";
  bool validatePin = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Row(
            children: [
              MyCustomIconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF00AC47),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyCustomText(
                  'Verificação',
                  fontSize: 24,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Insira o código de verificação que enviamos no seu endereço de e-mail abaixo!',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: PinCodeField(
                    onChanged: (pinCode) {
                      pinCodeController = pinCode;
                    },
                    validate: validatePin,
                  ),
                ),
                const SizedBox(height: 30),
                MyElevatedButton(
                  onPressed: () {
                    setState(() {
                      validatePin = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RecoveryPassword()),
                      );
                    }
                  },
                  child: const Center(
                    child: Text('Verificar'),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não recebeu o código?'),
                    TextButton(
                      onPressed: () {
                        // Navigator.popAndPushNamed(context, '');
                      },
                      child: const Text(
                        'Reenviar',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
