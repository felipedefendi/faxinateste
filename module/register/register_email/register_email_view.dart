import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/components/globals/elevatedButton_components.dart';
import 'package:frontfaxina/app/components/globals/field_components.dart';
import 'package:frontfaxina/app/components/globals/iconButton_componentes.dart';
import 'package:frontfaxina/app/components/globals/texto_components.dart';
import 'package:frontfaxina/app/core/utils/validator/fields_validators.dart';
import 'package:frontfaxina/app/model/client_register_model.dart';
import 'package:frontfaxina/app/module/register/register_email/controller/register_email_controller.dart';
import 'package:frontfaxina/app/module/register/register_faxina_view.dart';

class RegisterEmailView extends StatefulWidget {
  final RegisterEmailController controller;
  const RegisterEmailView({super.key, required this.controller});

  @override
  State<RegisterEmailView> createState() => _RegisterEmailViewState();
}

class _RegisterEmailViewState extends State<RegisterEmailView> {
  final _formKey = GlobalKey<FormState>();

  var userRegister = Modular.args.data as ClientRegisterModel;

  TextEditingController firstEmailController = TextEditingController();
  TextEditingController secondEmailController = TextEditingController();

  String firstEmail = '';
  String? secondEmail;

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
                  Modular.to.pop();
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
      body: BlocListener<RegisterEmailController, RegisterEmailState>(
        bloc: widget.controller,
        listener: (context, state) {
          if (state.status == RegisterEmailStatus.complete) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    'Pin de verificação enviado!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            );
            Modular.to.pushNamed('/register/pin',
                arguments: clientRegisterModel.email = firstEmail);
          } else if (state.status == RegisterEmailStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    'Falha no envio do Pin de verificação',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            );
          }
        },
        child: BlocSelector<RegisterEmailController, RegisterEmailState, bool>(
          bloc: widget.controller,
          selector: (state) => state.status == RegisterEmailStatus.loading,
          builder: (context, showLoading) {
            if (showLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyCustomText(
                        'Ok, vamos iniciar seu\n cadastro!',
                        fontSize: 24,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 60),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            MyTextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: firstEmailController,
                              labelText:
                                  'Qual o seu e-mail? ${clientRegisterModel.type}',
                              hintText: 'Insira o seu e-mail',
                              validator: (value) {
                                return FieldsValidators().emailValidator(value);
                              },
                            ),
                            const SizedBox(height: 20),
                            MyTextField(
                              controller: secondEmailController,
                              labelText: 'Confirme seu e-mail',
                              hintText: 'Insira o seu e-mail',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return FieldsValidators()
                                      .emailValidator(value);
                                } else if (FieldsValidators()
                                    .isNotEmailEquals(value, firstEmail)) {
                                  return 'O email digitado não corresponde';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      MyElevatedButton(
                        onPressed: () async {
                          setState(() {
                            firstEmail = firstEmailController.text;
                            secondEmail = secondEmailController.text;
                          });
                          clientRegisterModel =
                              ClientRegisterModel(email: firstEmail);
                          if (_formKey.currentState!.validate()) {
                            await widget.controller
                                .verifyEmailProgress(email: firstEmail);
                          }
                        },
                        child: const Center(
                          child: Text('Enviar código de confirmação'),
                        ),
                      ),
                      const SizedBox(height: 60),
                      const Text(
                        'Se estiver com dúvidas no cadastro entre em contato com o nosso suporte:\n 0800-9999',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Já possui uma conta?'),
                          TextButton(
                            onPressed: () {
                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     '/login', (Route<dynamic> route) => false);
                            },
                            child: const Text(
                              'Faça seu Login aqui',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
