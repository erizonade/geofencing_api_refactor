import 'package:flutter_test/flutter_test.dart';
import 'package:geofencing_api/geofencing_api.dart';

import 'dummy/geofence_region_dummy.dart';

void main() {
  group('geofence_status', () {
    test('fromName test', () {
      expect(GeofenceStatus.fromName('enter'), GeofenceStatus.enter);
      expect(GeofenceStatus.fromName('exit'), GeofenceStatus.exit);
      expect(GeofenceStatus.fromName('dwell'), GeofenceStatus.dwell);
    });
  });

  group('geofence_type', () {
    test('fromName test', () {
      expect(GeofenceType.fromName('circular'), GeofenceType.circular);
      expect(GeofenceType.fromName('polygon'), GeofenceType.polygon);
    });
  });

  group('lat_lng', () {
    const LatLng latLng = LatLng(32.1234, 128.1234);

    test('toJson test', () {
      final Map<String, dynamic> latLngJson = latLng.toJson();
      expect(latLngJson['latitude'], latLng.latitude);
      expect(latLngJson['longitude'], latLng.longitude);
    });

    test('fromJson test', () {
      final LatLng newLatLng = LatLng.fromJson(latLng.toJson());
      expect(newLatLng.latitude, latLng.latitude);
      expect(newLatLng.longitude, latLng.longitude);
    });
  });

  group('geofence_region', () {
    final GeofenceRegion region1 = circularRegion1;
    final GeofenceRegion region3 = polygonRegion1;

    test('circular constructor test', () {
      final GeofenceRegion region = GeofenceRegion.circular(
        id: region1.id,
        data: region1.data,
        center: (region1 as GeofenceCircularRegion).center,
        radius: region1.radius,
        loiteringDelay: region1.loiteringDelay,
      );
      expect(region, isA<GeofenceCircularRegion>());
      expect(region, isSameRegion(region1));
    });

    test('polygon constructor test', () {
      final GeofenceRegion region = GeofenceRegion.polygon(
        id: region3.id,
        data: region3.data,
        polygon: (region3 as GeofencePolygonRegion).polygon,
        loiteringDelay: region3.loiteringDelay,
      );
      expect(region, isA<GeofencePolygonRegion>());
      expect(region, isSameRegion(region3));
    });

    test('toJson test', () {
      final Map<String, dynamic> region1Json = region1.toJson();
      expect(
        region1Json,
        {
          'type': 'circular',
          'id': 'region_1',
          'data': {'name': 'National Museum of Korea'},
          'center': {'latitude': 37.523085, 'longitude': 126.979619},
          'radius': 250,
          'status': 'exit',
          'loiteringDelay': 60000,
          'timestamp': null,
        },
      );

      final Map<String, dynamic> region3Json = region3.toJson();
      expect(
        region3Json,
        {
          'type': 'polygon',
          'id': 'region_3',
          'data': {'name': 'Gyeongbokgung Palace'},
          'polygon': [
            {'latitude': 37.583696, 'longitude': 126.973739},
            {'latitude': 37.583441, 'longitude': 126.979361},
            {'latitude': 37.582506, 'longitude': 126.980198},
            {'latitude': 37.579054, 'longitude': 126.979490},
            {'latitude': 37.576112, 'longitude': 126.979061},
            {'latitude': 37.576503, 'longitude': 126.974126},
            {'latitude': 37.580959, 'longitude': 126.973568},
          ],
          'status': 'exit',
          'loiteringDelay': 60000,
          'timestamp': null,
        },
      );
    });

    test('fromJson test', () {
      final GeofenceRegion newRegion1 =
          GeofenceRegion.fromJson(region1.toJson());
      expect(newRegion1, isA<GeofenceCircularRegion>());
      expect(newRegion1, isSameRegion(region1));

      final GeofenceRegion newRegion3 =
          GeofenceRegion.fromJson(region3.toJson());
      expect(newRegion3, isA<GeofencePolygonRegion>());
      expect(newRegion3, isSameRegion(region3));
    });
  });
}

Matcher isSameRegion(GeofenceRegion region) {
  return _IsSameRegion(region);
}

class _IsSameRegion extends Matcher {
  const _IsSameRegion(this.region);

  final GeofenceRegion region;

  @override
  bool matches(dynamic item, Map<dynamic, dynamic> matchState) {
    if (item is! GeofenceRegion) {
      return false;
    }

    if (item.type != region.type ||
        item.id != region.id ||
        item.data != region.data ||
        item.status != region.status ||
        item.loiteringDelay != region.loiteringDelay ||
        item.timestamp != region.timestamp) {
      return false;
    }

    // item.type == region.type
    if (item is GeofenceCircularRegion) {
      final LatLng regionCenter = (region as GeofenceCircularRegion).center;
      final double regionRadius = (region as GeofenceCircularRegion).radius;
      if (item.center != regionCenter || item.radius != regionRadius) {
        return false;
      }
    }

    // item.type == region.type
    if (item is GeofencePolygonRegion) {
      final List<LatLng> regionPolygon =
          (region as GeofencePolygonRegion).polygon;
      if (!_deepEqualsList(item.polygon, regionPolygon)) {
        return false;
      }
    }

    return true;
  }

  bool _deepEquals(dynamic a, dynamic b) {
    if (a == b) {
      return true;
    }
    if (a is List) {
      return b is List && _deepEqualsList(a, b);
    }
    if (a is Map) {
      return b is Map && _deepEqualsMap(a, b);
    }
    return false;
  }

  bool _deepEqualsList(List<dynamic> a, List<dynamic> b) {
    if (a.length != b.length) {
      return false;
    }
    for (int i = 0; i < a.length; i++) {
      if (!_deepEquals(a[i], b[i])) {
        return false;
      }
    }
    return true;
  }

  bool _deepEqualsMap(Map<dynamic, dynamic> a, Map<dynamic, dynamic> b) {
    if (a.length != b.length) {
      return false;
    }
    for (final dynamic key in a.keys) {
      if (!b.containsKey(key) || !_deepEquals(a[key], b[key])) {
        return false;
      }
    }
    return true;
  }

  @override
  Description describe(Description description) {
    return description
        .addDescriptionOf(region)
        .add(' toJson(): ')
        .addDescriptionOf(region.toJson());
  }
}
