import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:frontfaxina/app/service/register/register_service.dart';
import 'package:frontfaxina/app/model/client_register_model.dart';
import 'package:intl/intl.dart';

const String url = 'http://192.168.1.5:8080';

class RegisterServiceImpl implements RegisterService {
  @override
  Future<ClientRegisterModel> register(
      ClientRegisterModel clientRegisterModel) async {
    try {
      final String birthdateString =
          DateFormat('dd-MM-yyyy').format(clientRegisterModel.birthdate!);

      final body = {
        'email': clientRegisterModel.email,
        'password': clientRegisterModel.password,
        'gender': clientRegisterModel.gender,
        'birthdate': birthdateString,
        'phone': clientRegisterModel.phone,
        'cpf': clientRegisterModel.cpf,
        'type': 'CLIENT'
      };

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      final response = await Dio().post(
        '$url/register',
        data: jsonEncode(body),
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final responseBody = response.data;
        ClientRegisterModel clientRegisterModel =
            ClientRegisterModel.fromJson(responseBody);

        return clientRegisterModel;
      } else {
        throw Exception('Resposta inesperada: campos ausentes.');
      }
    } catch (e) {
      throw Exception('Erro durante a requisição de registro: $e');
    }
  }
}
