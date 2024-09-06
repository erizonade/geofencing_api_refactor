import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'geofencing_api_platform_interface.dart';

/// An implementation of [GeofencingApiPlatform] that uses method channels.
class MethodChannelGeofencingApi extends GeofencingApiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('geofencing_api');
}
