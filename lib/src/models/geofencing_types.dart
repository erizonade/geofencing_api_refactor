import 'package:fl_location/fl_location.dart';

import 'geofence_region.dart';
import 'geofence_status.dart';

typedef GeofenceStatusChanged = Future<void> Function(
  GeofenceRegion geofenceRegion,
  GeofenceStatus geofenceStatus,
  Location location,
);

typedef GeofenceErrorCallback = void Function(
  Object error,
  StackTrace stackTrace,
);
