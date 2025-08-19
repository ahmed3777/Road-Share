import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roadshare/features/home/presentation/cubit/cubit/home_cubit.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}


class _CustomGoogleMapState extends State<CustomGoogleMap> {
  @override
  void initState() {
    context.read<HomeCubit>().getCurrentLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HomeSuccess) {
          // مستخدم لسه فاتح - يظهر مكانه الحالي فقط
          return GoogleMap(
            cameraTargetBounds: CameraTargetBounds.unbounded,
            initialCameraPosition: CameraPosition(
              target: LatLng(state.position.latitude, state.position.longitude),

              zoom: 15,
            ),
            markers: {
              Marker(
                markerId: const MarkerId("current"),
                position: LatLng(state.position.latitude, state.position.longitude),
                infoWindow: InfoWindow(title: "You are here"),
              ),
            },
            myLocationEnabled: true,
          );
        }
        if (state is RouteReady) {
          // مستخدم اختار وجهة - يرسم البداية والنهاية + خط بينهم
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: state.start,
              zoom: 13,
            ),
            markers: {
              Marker(
                markerId: const MarkerId("start"),
                position: state.start,
                infoWindow: const InfoWindow(title: "Start"),
              ),
              Marker(
                markerId: const MarkerId("destination"),
                position: state.destination,
                infoWindow: const InfoWindow(title: "Destination"),
              ),
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId("route"),
                points: [state.start, state.destination],
                color: Colors.blue,
                width: 6,
              ),
            },
          );
        }

        if (state is HomeFailure) {
          return Center(child: Text(state.errorMessage));
        }

        return const SizedBox();
      },
    );
  }
}
