class LocationServicesDisabledException implements Exception {
  LocationServicesDisabledException(
      [this.message = 'Location services is disabled.']);

  final String message;

  @override
  String toString() => 'LocationServicesDisabledException: $message';
}
