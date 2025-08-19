import 'dart:async';
import 'package:geolocator/geolocator.dart';

class CheckLocationPermission {
  final Position? position;
  final String? errorMessage;

  CheckLocationPermission({this.position, this.errorMessage});

  static Future<CheckLocationPermission> checkLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return CheckLocationPermission(
          errorMessage:
              'Location services are disabled. Please enable location services.',
        );
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return CheckLocationPermission(
            errorMessage:
                'Location permissions are denied. Please allow location access.',
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return CheckLocationPermission(
          errorMessage:
              'Location permissions are permanently denied. Please enable in settings.',
        );
      }

      // Get current position with optimized settings
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.bestForNavigation,
          distanceFilter: 100,
        ),
      );
      return CheckLocationPermission(position: position);
    } catch (e) {
      return CheckLocationPermission(
        errorMessage: 'Error getting location: $e',
      );
    }
  }

 
}
