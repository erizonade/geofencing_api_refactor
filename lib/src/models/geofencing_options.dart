class GeofencingOptions {
  GeofencingOptions({
    this.interval = 5000,
    this.accuracy = 100,
    this.statusChangeDelay = 10000,
    this.allowsMockLocation = false,
    this.printsDebugLog = true,
  }) : assert(interval >= 1000);

  final int interval;

  final int accuracy;

  final int statusChangeDelay;

  final bool allowsMockLocation;

  final bool printsDebugLog;

  GeofencingOptions copyWith({
    int? interval,
    int? accuracy,
    int? statusChangeDelay,
    bool? allowsMockLocation,
    bool? printsDebugLog,
  }) =>
      GeofencingOptions(
        interval: interval ?? this.interval,
        accuracy: accuracy ?? this.accuracy,
        statusChangeDelay: statusChangeDelay ?? this.statusChangeDelay,
        allowsMockLocation: allowsMockLocation ?? this.allowsMockLocation,
        printsDebugLog: printsDebugLog ?? this.printsDebugLog,
      );
}
