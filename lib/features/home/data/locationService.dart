// core/services/location_service.dart
import 'package:geocoding/geocoding.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  /// Converts latitude and longitude into a human-readable address.
  Future<String> getAddressFromLocation(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      final place = placemarks.first;
      return '${place.street ?? ''}, ${place.subLocality ?? ''}, ${place.locality ?? ''}';
    } catch (e) {
      return 'Address not found ';
    }
  }

  /// Converts a human-readable address into latitude and longitude.
  /// 
  /// Returns a [LatLng] object if the address is found, otherwise returns `null`.
  /// If an error occurs during the lookup, `null` is returned.
  Future<LatLng?> getLocationFromAddress(String address) async {
    try {
      final locations  = await geo.locationFromAddress(address);
       if (locations.isNotEmpty) {
        return LatLng(locations.first.latitude, locations.first.longitude);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

