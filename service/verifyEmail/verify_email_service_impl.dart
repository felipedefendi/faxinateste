import 'package:dio/dio.dart';
import 'package:frontfaxina/app/service/verifyEmail/verify_email_service.dart';

const String url = 'http://192.168.1.5:8080';

class VerifyEmailServiceImpl implements VerifyEmailService {
  @override
  Future<Response> sendMailValidation(String email) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final body = {'email': email};

    try {
      final response = await Dio().post(
        '$url/sendMailValidation',
        options: Options(headers: headers),
        data: body,
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Erro na requisição: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro inesperado: $e');
    }
  }
}
