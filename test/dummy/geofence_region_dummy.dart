import 'package:geofencing_api/geofencing_api.dart';

final GeofenceRegion circularRegion1 = GeofenceRegion.circular(
  id: 'region_1',
  data: {
    'name': 'National Museum of Korea',
  },
  center: const LatLng(37.523085, 126.979619),
  radius: 250,
  loiteringDelay: 60 * 1000,
);

final GeofenceRegion circularRegion2 = GeofenceRegion.circular(
  id: 'region_2',
  data: {
    'name': 'Dongdaemun Market',
  },
  center: const LatLng(37.566878, 127.010093),
  radius: 800,
);

final GeofenceRegion polygonRegion1 = GeofenceRegion.polygon(
  id: 'region_3',
  data: {
    'name': 'Gyeongbokgung Palace',
  },
  polygon: [
    const LatLng(37.583696, 126.973739),
    const LatLng(37.583441, 126.979361),
    const LatLng(37.582506, 126.980198),
    const LatLng(37.579054, 126.979490),
    const LatLng(37.576112, 126.979061),
    const LatLng(37.576503, 126.974126),
    const LatLng(37.580959, 126.973568),
  ],
  loiteringDelay: 60 * 1000,
);

final GeofenceRegion polygonRegion2 = GeofenceRegion.polygon(
  id: 'region_4',
  data: {
    'name': 'N Seoul Tower',
  },
  polygon: [
    const LatLng(37.556355, 126.984041),
    const LatLng(37.552307, 126.982067),
    const LatLng(37.546931, 126.984556),
    const LatLng(37.545468, 126.990178),
    const LatLng(37.542644, 126.991594),
    const LatLng(37.541010, 126.998117),
    const LatLng(37.543324, 127.001035),
    const LatLng(37.549551, 127.000906),
    const LatLng(37.555845, 126.993182),
  ],
);
