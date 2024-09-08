class LocationPermissionPermanentlyDeniedException implements Exception {
  LocationPermissionPermanentlyDeniedException(
      [this.message = 'Location permission is permanently denied.']);

  final String message;

  @override
  String toString() => 'LocationPermissionPermanentlyDeniedException: $message';
}
