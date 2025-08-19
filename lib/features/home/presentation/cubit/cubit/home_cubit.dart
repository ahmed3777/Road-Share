import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roadshare/core/services/check_location_permission.dart';
import 'package:roadshare/features/home/data/locationService.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.locationService) : super(HomeInitial());

  final LocationService locationService;
  GoogleMapController? mapController;
  Position? currentPosition;

  Future<void> getCurrentLocation() async {
    emit(HomeLoading());
    try {
      final result = await CheckLocationPermission.checkLocation();
      if (result.position != null) {
        currentPosition = result.position!; // احفظ الإحداثيات
        final address = await locationService.getAddressFromLocation(
          currentPosition!.latitude,
          currentPosition!.longitude,
        );
        emit(HomeSuccess(
            position: currentPosition!,
            address: address,
            errorMessage: result.errorMessage,
          ),
        );
       updateCamera(currentPosition!);

      } else {
        emit(HomeFailure(errorMessage: "No position found."));
      }
    } catch (e) {
      emit(
        HomeFailure(
          errorMessage: "Failed to fetch location. Please try again.",
        ),
      );
    }
  }

  /// حفظ الكنترولر للخريطة
  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }
  /// تحريك الكاميرا على موقع معين
  void updateCamera(Position position) {
    if (mapController == null) return;

    final latLng = LatLng(position.latitude, position.longitude);
    mapController!.animateCamera(CameraUpdate.newLatLngZoom(latLng, 18));
  }
 
  Future<LatLng?> getLocationFromAddress(String address) async {
   
    return  await locationService.getLocationFromAddress(address);

    }
  
// تجهيز بيانات المسار من نقطة الانطلاق لنقطة الوصول

    Future<void> buildRouteFromText({String? startAddress,required String destinationAddress,}) async {
      // لو المستخدم مدخلش عنوان بداية → استخدم GPS الحالي
      if (currentPosition == null) {
        await getCurrentLocation();
      }

      LatLng? startLatLng;
      if (startAddress != null && startAddress.isNotEmpty) {
        startLatLng = await getLocationFromAddress(startAddress);
      }
      startLatLng ??= LatLng(currentPosition!.latitude, currentPosition!.longitude);
      final destinationLatLng = await getLocationFromAddress(destinationAddress);
      if (destinationLatLng == null) {
        emit(HomeFailure(errorMessage: "Destination not found"));
        return;
      }
      emit(RouteReady(
        start: startLatLng,
        destination: destinationLatLng,
      ));
    }

}

  


