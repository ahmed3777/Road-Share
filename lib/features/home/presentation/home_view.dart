import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/services/location_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
   static const  String routeName = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  Position? _currentPosition;
  String? _errorMessage;
  bool _isLoading = true;
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _initializeLocation() async {
    if (!mounted) return;
    setState(() => _isLoading = true);
    try {
      final result = await CheckLocationPermission.checkLocation();
      if (!mounted) return;
      setState(() {
        _currentPosition = result.position;
        _errorMessage = result.errorMessage;
        _isLoading = false;
      });

      // Auto-zoom to location if map is ready
      _updateCameraPosition();
    } catch (e) {
      debugPrint('Location Error: $e');
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Failed to fetch location. Please try again.';
        _isLoading = false;
      });
    }
  }

  void _updateCameraPosition() {
    if (_currentPosition == null || _mapController == null) return;

    final latLng = LatLng(
      _currentPosition!.latitude,
      _currentPosition!.longitude,
    );

    _mapController!.animateCamera(
      CameraUpdate.newLatLngZoom(latLng, 18),
    );
  }

  Widget _buildLoadingState() => const Center(
    child: CircularProgressIndicator(),
  );

  Widget _buildErrorState() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_errorMessage != null)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _errorMessage!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _initializeLocation,
          child: const Text('Retry'),
        ),
      ],
    ),
  );

  Widget _buildMap() => GoogleMap(
    mapType: MapType.terrain,
    initialCameraPosition: CameraPosition(
      target: LatLng(
        _currentPosition?.latitude ?? 0.0,
        _currentPosition?.longitude ?? 0.0,
      ),
      zoom: 18,
    ),
    onMapCreated: (controller) {
      _mapController = controller;
      _updateCameraPosition();
    },
    myLocationEnabled: true,
    myLocationButtonEnabled: true,
    zoomControlsEnabled: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location'),
      ),
      body: _isLoading
          ? _buildLoadingState()
          : _currentPosition == null
          ? _buildErrorState()
          : _buildMap(),
      floatingActionButton: FloatingActionButton(
        onPressed: _initializeLocation,
        tooltip: 'Refresh Location',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}