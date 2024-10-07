import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontfaxina/app/components/globals/elevatedButton_components.dart';
import 'package:frontfaxina/app/components/globals/field_components.dart';
import 'package:frontfaxina/app/components/globals/iconButton_componentes.dart';
import 'package:frontfaxina/app/components/globals/texto_components.dart';
import 'package:frontfaxina/app/core/utils/validator/fields_validators.dart';
import 'package:frontfaxina/app/module/login/controller/login_controller.dart';

class LoginFaxinaView extends StatefulWidget {
  final LoginController controller;
  const LoginFaxinaView({super.key, required this.controller});

  @override
  State<LoginFaxinaView> createState() => _LoginFaxinaViewState();
}

class _LoginFaxinaViewState extends State<LoginFaxinaView> {
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: MyCustomIconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/initial');
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF00AC47),
            ),
          ),
        ),
      ),
      body: BlocListener<LoginController, LoginState>(
        bloc: widget.controller,
        listener: (context, state) {
          if (state.status == LoginStatus.complete) {
            Modular.to.pushNamed('/home');
          } else if (state.status == LoginStatus.failure) {
            // Mostrar alerta de erro ou algo semelhante
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'Erro ao fazer login. Verifique e-mail e/ou senha',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    children: [
                      MyCustomText('Seja bem vindo'),
                      MyCustomText('ao Faxina!')
                    ],
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Align(
                        alignment: Alignment.center,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth > 600
                                ? 500
                                : constraints.maxWidth,
                          ),
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyTextField(
                                    controller: emailController,
                                    labelText: 'Email',
                                    hintText: 'Insira o seu e-mail',
                                    validator: (value) {
                                      return FieldsValidators()
                                          .emailValidator(value);
                                    },
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    child: MyTextField(
                                      controller: passwordController,
                                      labelText: 'Senha',
                                      hintText: 'Insira a sua senha',
                                      sufixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isObscure = !isObscure;
                                          });
                                        },
                                        icon: Icon(isObscure
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                      ),
                                      validator: (value) {
                                        return FieldsValidators()
                                            .passwordValidator(value);
                                      },
                                      obscureText: isObscure,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/recovery-password');
                                    },
                                    child: const Text('Esqueci minha senha'),
                                  ),
                                  BlocSelector<LoginController, LoginState,
                                          bool>(
                                      bloc: widget.controller,
                                      selector: (state) =>
                                          state.status == LoginStatus.loading,
                                      builder: (context, showLoading) {
                                        return Visibility(
                                          visible: showLoading,
                                          child: const Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Center(
                                              child: CircularProgressIndicator
                                                  .adaptive(),
                                            ),
                                          ),
                                        );
                                      })
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await widget.controller.loginProgess(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      child: const Center(
                        child: Text('Login'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Não tem uma conta?'),
                        TextButton(
                          onPressed: () {
                            Modular.to.pushNamed('/register');
                          },
                          child: const Text(
                            'Registre-se agora!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
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
