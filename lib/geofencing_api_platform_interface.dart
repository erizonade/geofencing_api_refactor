import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'geofencing_api_method_channel.dart';

abstract class GeofencingApiPlatform extends PlatformInterface {
  /// Constructs a GeofencingApiPlatform.
  GeofencingApiPlatform() : super(token: _token);

  static final Object _token = Object();

  static GeofencingApiPlatform _instance = MethodChannelGeofencingApi();

  /// The default instance of [GeofencingApiPlatform] to use.
  ///
  /// Defaults to [MethodChannelGeofencingApi].
  static GeofencingApiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GeofencingApiPlatform] when
  /// they register themselves.
  static set instance(GeofencingApiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
