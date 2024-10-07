import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/components/globals/elevatedButton_components.dart';
import 'package:frontfaxina/app/components/globals/iconButton_componentes.dart';
import 'package:frontfaxina/app/components/globals/pin_code_field_components.dart';
import 'package:frontfaxina/app/components/globals/texto_components.dart';
import 'package:frontfaxina/app/module/register/register_code/controller/register_code_controller.dart';
import 'package:frontfaxina/app/module/register/register_faxina_view.dart';

class RegisterCodeScreen extends StatefulWidget {
  final RegisterCodeController controller;
  const RegisterCodeScreen({super.key, required this.controller});

  @override
  State<RegisterCodeScreen> createState() => _RegisterCodeScreenState();
}

class _RegisterCodeScreenState extends State<RegisterCodeScreen> {
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
      body: BlocListener<RegisterCodeController, RegisterCodeState>(
        bloc: widget.controller,
        listener: (context, state) {
          if (state.status == RegisterCodeStatus.complete) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Pin de verificação validado com sucesso!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
            Modular.to.pushNamed('/register/nome');
          } else if (state.status == RegisterCodeStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'Falha na verificação do código PIN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          }
        },
        child: BlocSelector<RegisterCodeController, RegisterCodeState, bool>(
            bloc: widget.controller,
            selector: (state) => state.status == RegisterCodeStatus.loading,
            builder: (context, isLoading) {
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else {
                return SingleChildScrollView(
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
                            onPressed: () async {
                              setState(() {
                                validatePin = true;
                              });
                              if (_formKey.currentState!.validate()) {
                                await widget.controller.verifyPinCodeProgress(
                                    pinCode: pinCodeController!,
                                    email:
                                        clientRegisterModel.email.toString());
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
                                  // Implementa o reenviar código
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
                );
              }
            }),
      ),
    );
  }
}
