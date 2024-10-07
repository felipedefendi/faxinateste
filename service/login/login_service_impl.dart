import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontfaxina/app/model/login_model.dart';
import 'package:frontfaxina/app/service/login/login_service.dart';

const String url = 'http://192.168.1.5:8080';
const storage = FlutterSecureStorage();

class LoginServiceImpl implements LoginService {
  @override
  Future<LoginModel> login(String email, String password) async {
    try {
      final body = {'email': email, 'password': password};

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      final response = await Dio().post(
        '$url/login',
        data: jsonEncode(body),
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        final responseBody = response.data;

        if (responseBody['token'] != null && responseBody['persons'] != null) {
          await storage.write(key: 'token', value: responseBody['token']);
          await storage.write(
            key: 'person',
            value: jsonEncode(responseBody['persons']),
          );

          LoginModel login = LoginModel.fromJson(responseBody);
          return login;
        } else {
          throw Exception('Resposta inesperada: campos ausentes.');
        }
      } else {
        throw Exception('Erro ao realizar login: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro durante a requisição de login: $e');
    }
  }
}
