import 'package:frontfaxina/app/model/user_feed.dart';

abstract class FeedService {
  Future<List<FeedResponse>?> clientFeed(
    int distance,
    int addressID,
  );
}
