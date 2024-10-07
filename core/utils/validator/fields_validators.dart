import 'package:intl/intl.dart';

class FieldsValidators {
  String? emailValidator(String? value) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || value.isEmpty) {
      return 'O campo de email é obrigatório!';
    } else if (!regex.hasMatch(value)) {
      return 'Email inválido!';
    }
    return null;
  }

  bool isNotEmailEquals(String? value, String? email) {
    if (value != email) {
      return true;
    }
    return false;
  }

  String? passwordValidator(String? value) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,32}$');
    if (value == null || value.isEmpty) {
      return 'O campo de senha é obrigatório!';
    } else if (!regex.hasMatch(value)) {
      return 'Senha inválida. A senha deve conter letras Maiúsculas,\n números e caracteres especiais.';
    }
    return null;
  }

  bool isNotPasswordEquals(String? value, String? password) {
    if (value != password) {
      return true;
    }
    return false;
  }

  String? nomeValidator(String? value) {
    final regex = RegExp(r'^[a-zA-ZÀ-ÿ\s]+$');
    if (value == null || value.isEmpty) {
      return 'O campo de nome é obrigatório!';
    } else if (value.length < 2) {
      return 'O nome deve ter pelo menos 2 caracteres!';
    } else if (!regex.hasMatch(value)) {
      return 'Nome inválido! Use apenas letras e espaços.';
    }
    return null;
  }

  String? sobrenomeValidator(String? value) {
    final regex = RegExp(r'^[a-zA-ZÀ-ÿ\s]+$');
    if (value == null || value.isEmpty) {
      return 'O campo de nome é obrigatório!';
    } else if (value.length < 2) {
      return 'O nome deve ter pelo menos 2 caracteres!';
    } else if (!regex.hasMatch(value)) {
      return 'Nome inválido! Use apenas letras e espaços.';
    }
    return null;
  }

  String? cpfValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo de CPF é obrigatório!';
    }

    final cpf = value.replaceAll(RegExp(r'\D'), '');

    if (cpf.length != 11) {
      return 'CPF inválido!';
    }

    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) {
      return 'CPF inválido!';
    }

    int calcCheckDigit(String cpf, int length) {
      int sum = 0;
      for (int i = 0; i < length; i++) {
        sum += int.parse(cpf[i]) * (length + 1 - i);
      }
      int remainder = sum % 11;
      return remainder < 2 ? 0 : 11 - remainder;
    }

    final firstCheckDigit = calcCheckDigit(cpf, 9);
    final secondCheckDigit = calcCheckDigit(cpf, 10);

    if (firstCheckDigit != int.parse(cpf[9]) ||
        secondCheckDigit != int.parse(cpf[10])) {
      return 'CPF inválido!';
    }

    return null;
  }

  String? validateMobile(String value) {
    if (value.length < 15) {
      return 'Número inválido e/ou incorreto!';
    }
    return null;
  }

  String? dataNascimentoValidator(DateTime? date) {
    if (date == null) {
      return 'A data de nascimento é obrigatória!';
    }

    DateTime today = DateTime.now();
    DateTime minDate = DateTime(today.year - 18, today.month, today.day);

    if (date.isAfter(minDate)) {
      return 'A pessoa deve ter pelo menos 18 anos.';
    }

    return null;
  }

  String? validateDateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'A data de nascimento é obrigatória!';
    }

    final regex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!regex.hasMatch(value)) {
      return 'Formato de data inválido! Use o formato dd/MM/yyyy.';
    }

    try {
      DateTime date = DateFormat('dd/MM/yyyy').parseStrict(value);
      return dataNascimentoValidator(date);
    } catch (e) {
      return 'Formato de data inválido! Use o formato dd/MM/yyyy.';
    }
  }
}
