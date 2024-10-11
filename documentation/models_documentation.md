## Models

### :chicken: GeofenceRegion (abstract)

This class represents a region containing a geofence.

| props            | type           | description                                                                                                  |
|------------------|----------------|--------------------------------------------------------------------------------------------------------------|
| `type`           | GeofenceType   | The type of the geofence.                                                                                    |
| `id`             | String         | The unique id of the geofence region.                                                                        |
| `data`           | Object?        | The data of the geofence region.                                                                             |
| `status`         | GeofenceStatus | The status of the geofence. The default is `GeofenceStatus.exit`.                                            |
| `loiteringDelay` | int            | The delay between `GeofenceStatus.enter` and `GeofenceStatus.dwell` in milliseconds. The default is `30000`. |
| `timestamp`      | DateTime?      | The time the geofence status was updated.                                                                    |

| constructor | description                                      |
|-------------|--------------------------------------------------|
| `.circular` | Creates a GeofenceRegion with the circular type. |
| `.polygon`  | Creates a GeofenceRegion with the polygon type.  |

### :chicken: GeofenceCircularRegion (extends GeofenceRegion)

A GeofenceRegion with the circular type.

| props    | type   | description                                                            |
|----------|--------|------------------------------------------------------------------------|
| `center` | LatLng | The center coordinates of the geofence.                                |
| `radius` | double | The radius of the geofence. This value should be 10 meters or greater. |

| method   | description                                                    |
|----------|----------------------------------------------------------------|
| `toJson` | Returns the fields of `GeofenceCircularRegion` in JSON format. |

### :chicken: GeofencePolygonRegion (extends GeofenceRegion)

A GeofenceRegion with the polygon type.

| props     | type         | description                                                                      |
|-----------|--------------|----------------------------------------------------------------------------------|
| `polygon` | List<LatLng> | The polygon coordinates of the geofence. This value must have size 3 or greater. |

| method   | description                                                   |
|----------|---------------------------------------------------------------|
| `toJson` | Returns the fields of `GeofencePolygonRegion` in JSON format. |

### :chicken: GeofenceType

This class represents the geofence type.

| value      | description                       |
|------------|-----------------------------------|
| `circular` | A geofence with a circular shape. |
| `polygon`  | A geofence with a polygon shape.  |

### :chicken: GeofenceStatus

This class represents the geofence state.

| value   | description                                                            |
|---------|------------------------------------------------------------------------|
| `enter` | The device has entered the geofence area.                              |
| `exit`  | The device has exited the geofence area.                               |
| `dwell` | The device stayed in the geofence area longer than the loiteringDelay. |
