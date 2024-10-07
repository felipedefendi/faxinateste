import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/components/globals/elevatedButton_components.dart';
import 'package:frontfaxina/app/components/globals/field_components.dart';
import 'package:frontfaxina/app/components/globals/iconButton_componentes.dart';
import 'package:frontfaxina/app/components/globals/texto_components.dart';
import 'package:frontfaxina/app/core/utils/mask/mask_fields.dart';
import 'package:frontfaxina/app/core/utils/validator/fields_validators.dart';
import 'package:frontfaxina/app/module/register/register_faxina_view.dart';

class RegisterCpfView extends StatefulWidget {
  const RegisterCpfView({super.key});

  @override
  State<RegisterCpfView> createState() => _RegisterCpfViewState();
}

class _RegisterCpfViewState extends State<RegisterCpfView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController cpf = TextEditingController();

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
              children: [
                MyCustomText(
                  'Qual o número de CPF?',
                  fontSize: 32,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        inputFormatters: [MaskFields().cpfNumberMask],
                        keyboardType: TextInputType.number,
                        controller: cpf,
                        labelText: 'CPF',
                        hintText: 'Insira seu cpf',
                        validator: (value) {
                          return FieldsValidators().cpfValidator(value);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                MyElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String formattedCpf =
                          cpf.text.replaceAll(RegExp(r'[.\s-]'), '');
                      Modular.to.pushNamed(
                        '/register/numero',
                        arguments: clientRegisterModel.cpf = formattedCpf,
                      );
                    }
                  },
                  child: const Center(
                    child: Text('Próximo'),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Se estiver com dúvidas no cadastro entre em contato com o nosso suporte:\n 0800-9999',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
