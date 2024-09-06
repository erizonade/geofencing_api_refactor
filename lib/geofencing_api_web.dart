import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'geofencing_api_platform_interface.dart';

/// A web implementation of the GeofencingApiPlatform of the GeofencingApi plugin.
class GeofencingApiWeb extends GeofencingApiPlatform {
  /// Constructs a GeofencingApiWeb
  GeofencingApiWeb();

  static void registerWith(Registrar registrar) {
    GeofencingApiPlatform.instance = GeofencingApiWeb();
  }
}
