import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontfaxina/app/service/addresses/addresses_service.dart';

const String url = 'http://192.168.1.5:8080';
const storage = FlutterSecureStorage();

class AddressesServiceImpl implements AddressesService {
  @override
  Future<Response> getAddress() async {
    final token = await storage.read(key: 'token');

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await Dio().get(
        '$url/address',
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  @override
  Future<Response> postAddress({
    required String country,
    required String state,
    required String city,
    required String street,
    required String number,
    required String additional,
    required String cep,
    required String neighborhood,
  }) async {
    try {
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: 'token');

      final body = {
        'person_id': 1,
        'state': state,
        'city': city,
        'country': country,
        'street': street,
        'number': number,
        'additional': additional,
        'cep': cep,
        'neighborhood': neighborhood,
      };
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response = await Dio().post(
        '$url/address',
        data: body,
        options: Options(headers: headers),
      );

      return response;
    } catch (e) {
      throw Exception('Erro na requisição. $e');
    }
  }
}
