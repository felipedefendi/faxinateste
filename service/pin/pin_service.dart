import 'package:dio/dio.dart';

abstract class PinService {
  Future<Response> verifyPinCode(
    String email,
    String pinCode,
  );
}
