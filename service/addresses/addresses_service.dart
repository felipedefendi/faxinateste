import 'package:dio/dio.dart';

abstract class AddressesService {
  Future<Response> getAddress();

  Future<Response> postAddress({
    required String country,
    required String state,
    required String city,
    required String street,
    required String number,
    required String additional,
    required String cep,
    required String neighborhood,
  });
}
