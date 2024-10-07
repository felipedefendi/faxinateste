import 'package:flutter/material.dart';

class PinCodeField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final bool validate;

  const PinCodeField({
    super.key,
    required this.onChanged,
    this.validate = false,
  });

  @override
  _PinCodeFieldState createState() => _PinCodeFieldState();
}

class _PinCodeFieldState extends State<PinCodeField> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  String? pinCodeTest = '1234';
  String pin = "";

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handlePinChange() {
    pin = _controllers.map((controller) => controller.text).join();
    widget.onChanged(pin);
  }

  String? _validatePinCode() {
    if (widget.validate) {
      for (var controller in _controllers) {
        if (controller.text.isEmpty) {
          return 'Há campos de PIN vazios!';
        }
      }
      // if (pin != pinCodeTest) {
      //   return 'Código PIN inválido';
      // } else {
      //   return null;
      // }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (value) => _validatePinCode(),
      builder: (FormFieldState<String> state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  child: TextFormField(
                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                      _handlePinChange();
                      state.didChange(value);
                    },
                  ),
                );
              }),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  state.errorText!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
