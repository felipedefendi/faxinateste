class FeedRequest {
  final int maxDistance;
  final int addressId;

  FeedRequest({
    required this.maxDistance,
    required this.addressId,
  });

  Map<String, dynamic> toJson() {
    return {
      'max_distance': maxDistance,
      'address_id': addressId,
    };
  }
}
