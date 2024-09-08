import 'package:meta/meta.dart';

import 'geofence_region_type.dart';
import 'geofence_status.dart';
import 'lat_lng.dart';

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

  final GeofenceRegionType type;

  final String id;

  final Object? data;

  final GeofenceStatus status;

  final int loiteringDelay;

  final DateTime? timestamp;

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

  Map<String, dynamic> toJson();

  @internal
  GeofenceRegion updateWith({
    GeofenceStatus? status,
    DateTime? timestamp,
  });
}

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
        super(type: GeofenceRegionType.circular);

  final LatLng center;

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

class GeofencePolygonRegion extends GeofenceRegion {
  GeofencePolygonRegion({
    required super.id,
    super.data,
    required this.polygon,
    super.status,
    super.loiteringDelay,
    super.timestamp,
  })  : assert(polygon.length >= 3),
        super(type: GeofenceRegionType.polygon);

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
