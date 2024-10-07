import 'package:dio/dio.dart';
import 'package:frontfaxina/app/service/pin/pin_service.dart';

const String url = 'http://192.168.1.5:8080';

class PinServiceImpl implements PinService {
  @override
  Future<Response> verifyPinCode(String email, String pinCode) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final body = {'email': email, 'pinCode': pinCode};

    try {
      final response = await Dio().post(
        '$url/verifyPinCode',
        options: Options(headers: headers),
        data: body,
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Código PIN inválido ou outro erro na validação.');
      }
    } catch (e) {
      throw Exception('Erro na requisição $e');
    }
  }
}
