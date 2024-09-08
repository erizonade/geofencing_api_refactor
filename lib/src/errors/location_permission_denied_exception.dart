class LocationPermissionDeniedException implements Exception {
  LocationPermissionDeniedException(
      [this.message = 'Location permission is denied.']);

  final String message;

  @override
  String toString() => 'LocationPermissionDeniedException: $message';
}
