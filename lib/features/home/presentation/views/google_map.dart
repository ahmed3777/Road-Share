import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/custom_progress_ind.dart';
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

          return Center(child: CustomProgressInd(
            
          ));
        } else if (state is HomeSuccess) {
          final position = state.position;
          final cubit = context.read<HomeCubit>();

          return GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18,
            ),
            onMapCreated: (controller) {
              cubit.setMapController(controller);
              cubit.updateCamera(position);
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
          );
        } else if (state is HomeFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () =>
                      context.read<HomeCubit>().getCurrentLocation(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
  }
