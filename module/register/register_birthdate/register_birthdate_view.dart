import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontfaxina/app/components/globals/elevatedButton_components.dart';
import 'package:frontfaxina/app/components/globals/field_components.dart';
import 'package:frontfaxina/app/components/globals/iconButton_componentes.dart';
import 'package:frontfaxina/app/components/globals/texto_components.dart';
import 'package:frontfaxina/app/core/utils/mask/mask_fields.dart';
import 'package:frontfaxina/app/core/utils/validator/fields_validators.dart';
import 'package:frontfaxina/app/module/register/register_faxina_view.dart';
import 'package:intl/intl.dart';

class RegisterBirthdateView extends StatefulWidget {
  const RegisterBirthdateView({super.key});

  @override
  State<RegisterBirthdateView> createState() => _RegisterBirthdateViewState();
}

class _RegisterBirthdateViewState extends State<RegisterBirthdateView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController dateTimeController = TextEditingController();

  DateTime? dateTime;

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
                  'Olá, ${clientRegisterModel.name}, pode preencher a sua data de nascimento abaixo?',
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
                        inputFormatters: [MaskFields().birthDateMask],
                        keyboardType: TextInputType.datetime,
                        controller: dateTimeController,
                        labelText: 'DD/MM/YYYY',
                        validator: (value) {
                          return FieldsValidators().validateDateInput(value);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                MyElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        dateTime = DateFormat('dd/MM/yyyy')
                            .parseStrict(dateTimeController.text);
                      });
                      Modular.to.pushNamed(
                        '/register/gender',
                        arguments: clientRegisterModel.birthdate = dateTime,
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
