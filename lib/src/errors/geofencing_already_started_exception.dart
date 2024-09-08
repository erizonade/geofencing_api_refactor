class GeofencingAlreadyStartedException implements Exception {
  GeofencingAlreadyStartedException(
      [this.message = 'The geofencing service has already started.']);

  final String message;

  @override
  String toString() => 'GeofencingAlreadyStartedException: $message';
}
