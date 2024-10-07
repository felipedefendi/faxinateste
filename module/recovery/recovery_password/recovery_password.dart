import 'package:flutter/material.dart';
import 'package:frontfaxina/app/components/globals/elevatedButton_components.dart';
import 'package:frontfaxina/app/components/globals/field_components.dart';
import 'package:frontfaxina/app/components/globals/iconButton_componentes.dart';
import 'package:frontfaxina/app/components/globals/texto_components.dart';
import 'package:frontfaxina/app/core/utils/validator/fields_validators.dart';
import 'package:frontfaxina/app/module/recovery/success/success_recovery.dart';

class RecoveryPassword extends StatefulWidget {
  const RecoveryPassword({super.key});

  @override
  State<RecoveryPassword> createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordOne = TextEditingController();
  TextEditingController passwordTwo = TextEditingController();

  String? passwordOneString;
  String? passwordTwoString;

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
                  'Criar nova senha',
                  fontSize: 24,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Sua nova senha deve ser diferente das senhas anteriores',
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        controller: passwordOne,
                        labelText: 'Nova senha',
                        hintText: 'Insira sua nova senha',
                        validator: (value) {
                          return FieldsValidators().passwordValidator(value);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        controller: passwordTwo,
                        labelText: 'Nova senha',
                        hintText: 'Confirmar nova senha',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return FieldsValidators().passwordValidator(value);
                          } else if (FieldsValidators()
                              .isNotPasswordEquals(value, passwordOneString)) {
                            return 'Senha digitada não corresponde';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                MyElevatedButton(
                  onPressed: () {
                    setState(() {
                      passwordOneString = passwordOne.text;
                      passwordTwoString = passwordTwo.text;
                    });
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessRecovery(),
                        ),
                      );
                    }
                  },
                  child: const Center(
                    child: Text('Redefinir senha'),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Lembrou a sua senha?'),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/login');
                      },
                      child: const Text(
                        'Login',
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
