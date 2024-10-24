class LatLng {
  const LatLng(this.latitude, this.longitude);

  final double latitude;

  final double longitude;

  factory LatLng.fromJson(Map<String, dynamic> json) =>
      LatLng(json['latitude'], json['longitude']);

  Map<String, dynamic> toJson() =>
      {'latitude': latitude, 'longitude': longitude};
}
