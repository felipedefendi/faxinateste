class FeedResponse {
  String name;
  double fullPrice;
  double halfPrice;
  String distance;

  FeedResponse({
    required this.name,
    required this.fullPrice,
    required this.halfPrice,
    required this.distance,
  });

  factory FeedResponse.fromJson(Map<String, dynamic> json) {
    return FeedResponse(
      name: json['Name'] as String,
      fullPrice: (json['FullPrice'] as num).toDouble(),
      halfPrice: (json['HalfPrice'] as num).toDouble(),
      distance: json['Distance'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'FullPrice': fullPrice,
      'HalfPrice': halfPrice,
      'Distance': distance,
    };
  }

  static List<FeedResponse> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => FeedResponse.fromJson(json)).toList();
  }
}
