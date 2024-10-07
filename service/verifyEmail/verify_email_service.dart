import 'package:dio/dio.dart';

abstract class VerifyEmailService {
  Future<Response> sendMailValidation(String email);
}
