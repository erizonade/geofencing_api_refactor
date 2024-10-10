import 'package:meta/meta.dart';

import 'geofence_type.dart';
import 'geofence_status.dart';
import 'lat_lng.dart';

/// This class represents a region containing a geofence.
abstract class GeofenceRegion {
  GeofenceRegion({
    required this.type,
    required this.id,
    this.data,
    this.status = GeofenceStatus.exit,
    int? loiteringDelay,
    this.timestamp,
  })  : loiteringDelay = loiteringDelay ?? 30000,
        assert(id.isNotEmpty);

  /// The type of the geofence.
  final GeofenceType type;

  /// The unique id of the geofence region.
  final String id;

  /// The data of the geofence region.
  final Object? data;

  /// The status of the geofence.
  ///
  /// The default is `GeofenceStatus.exit`.
  final GeofenceStatus status;

  /// The delay between [GeofenceStatus.enter] and [GeofenceStatus.dwell] in milliseconds.
  ///
  /// The default is `30000`.
  final int loiteringDelay;

  /// The time the geofence status was updated.
  final DateTime? timestamp;

  /// Creates a GeofenceRegion with the circular type.
  factory GeofenceRegion.circular({
    required String id,
    Object? data,
    required LatLng center,
    required double radius,
    int? loiteringDelay,
  }) =>
      GeofenceCircularRegion(
        id: id,
        data: data,
        center: center,
        radius: radius,
        loiteringDelay: loiteringDelay,
      );

  /// Creates a GeofenceRegion with the polygon type.
  factory GeofenceRegion.polygon({
    required String id,
    Object? data,
    required List<LatLng> polygon,
    int? loiteringDelay,
  }) =>
      GeofencePolygonRegion(
        id: id,
        data: data,
        polygon: polygon,
        loiteringDelay: loiteringDelay,
      );

  /// Returns the fields of [GeofenceRegion] in JSON format.
  Map<String, dynamic> toJson();

  @internal
  GeofenceRegion updateWith({
    GeofenceStatus? status,
    DateTime? timestamp,
  });
}

/// A GeofenceRegion with the circular type.
class GeofenceCircularRegion extends GeofenceRegion {
  GeofenceCircularRegion({
    required super.id,
    super.data,
    required this.center,
    required this.radius,
    super.status,
    super.loiteringDelay,
    super.timestamp,
  })  : assert(radius >= 10),
        super(type: GeofenceType.circular);

  /// The center coordinates of the geofence.
  final LatLng center;

  /// The radius of the geofence.
  ///
  /// This value should be 10 meters or greater.
  final double radius;

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'data': data,
        'center': center.toJson(),
        'radius': radius,
        'status': status,
        'loiteringDelay': loiteringDelay,
        'timestamp': timestamp,
      };

  @internal
  @override
  GeofenceRegion updateWith({
    GeofenceStatus? status,
    DateTime? timestamp,
  }) =>
      GeofenceCircularRegion(
        id: id,
        data: data,
        center: center,
        radius: radius,
        status: status ?? this.status,
        loiteringDelay: loiteringDelay,
        timestamp: timestamp ?? this.timestamp,
      );
}

/// A GeofenceRegion with the polygon type.
class GeofencePolygonRegion extends GeofenceRegion {
  GeofencePolygonRegion({
    required super.id,
    super.data,
    required this.polygon,
    super.status,
    super.loiteringDelay,
    super.timestamp,
  })  : assert(polygon.length >= 3),
        super(type: GeofenceType.polygon);

  /// The polygon coordinates of the geofence.
  ///
  /// This value must have size 3 or greater.
  final List<LatLng> polygon;

  @override
  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        'data': data,
        'polygon': polygon.map((e) => e.toJson()).toList(),
        'status': status,
        'loiteringDelay': loiteringDelay,
        'timestamp': timestamp,
      };

  @internal
  @override
  GeofenceRegion updateWith({
    GeofenceStatus? status,
    DateTime? timestamp,
  }) =>
      GeofencePolygonRegion(
        id: id,
        data: data,
        polygon: polygon,
        status: status ?? this.status,
        loiteringDelay: loiteringDelay,
        timestamp: timestamp ?? this.timestamp,
      );
}
