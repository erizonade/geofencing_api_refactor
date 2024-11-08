## 1.4.0

* [**CHORE**] Upgrade dependencies
  - Change the behavior of `Geofencing.instance.requestLocationPermission` [#21](https://github.com/Dev-hwang/flutter_location/issues/21)
  - Allow incremental location permission requests
  - Check [How to use-1](https://pub.dev/packages/geofencing_api#how-to-use) for more details

## 1.3.0

* [**FEAT**] Add `GeofenceRegion.distanceTo(Location)` function
* [**FIX**] Fix `GeofenceRegion.fromJson` parsing error

## 1.2.0

* [**CHORE**] Upgrade dependencies
  - Allow use of `Geofencing.instance.getLocationPermission` in the background
  - Allow `ACCESS_COARSE_LOCATION` permission

## 1.1.0

* [**FEAT**] Add `GeofenceRegion.fromJson` constructor
* [**FEAT**] Add `LatLng.fromJson` constructor

## 1.0.0

* Initial release.
