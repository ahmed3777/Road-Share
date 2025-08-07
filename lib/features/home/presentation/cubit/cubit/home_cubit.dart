
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roadshare/core/services/location_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  
   GoogleMapController? mapController;

   Future<void> getCurrentLocation() async {
    emit(HomeLoading());
    try{
      final result = await CheckLocationPermission.checkLocation();
      if (result.position != null) {
        emit(HomeSuccess(position: result.position!,
            errorMessage: result.errorMessage));
      } else {
        emit(HomeFailure(errorMessage: "No position found."));
      }
    }catch (e) {
        emit(HomeFailure(errorMessage: "Failed to fetch location. Please try again."));
      }
    }
     void setMapController(GoogleMapController controller) {
         mapController = controller;
      }
  void updateCamera(Position position) {
    if (mapController == null) return;

    final latLng = LatLng(position.latitude, position.longitude);
    mapController!.animateCamera(
      CameraUpdate.newLatLngZoom(latLng, 18),
    );
  }

  }


