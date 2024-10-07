import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontfaxina/app/service/feed/feed_service.dart';
import 'package:frontfaxina/app/model/user_feed.dart';

const String url = 'http://192.168.1.5:8080';
const storage = FlutterSecureStorage();

class FeedServiceImpl implements FeedService {
  @override
  Future<List<FeedResponse>?> clientFeed(int distance, int addressID) async {
    try {
      const storage = FlutterSecureStorage();
      final token = await storage.read(key: 'token');

      final body = {'max_distance': distance, 'address_id': 2};
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response = await Dio().post(
        '$url/feed',
        data: body,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data as List<dynamic>;
        List<FeedResponse> feedList = FeedResponse.fromJsonList(
            responseData.map((item) => item as Map<String, dynamic>).toList());

        return feedList;
      } else {
        throw Exception(
            'Erro no retorno da api, status code: ${response.statusCode}');
      }
    } catch (e) {
      'Erro na chamada da requisição, status code: $e';
      return null;
    }
  }
}
