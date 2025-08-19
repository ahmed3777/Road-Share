part of 'home_cubit.dart';

sealed class HomeState  {
}

class HomeAddressFetched extends HomeState {
  final Position position;
  final String address;
  HomeAddressFetched({required this.position, required this.address});
}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeFailure extends HomeState {
  final String errorMessage;
  HomeFailure({required this.errorMessage});
  }
final class HomeSuccess extends HomeState {
  final Position position;
  final String? errorMessage;
  final String? address;
  HomeSuccess( {required this.position, this.address,this.errorMessage});
}
  final class RouteReady extends HomeState {
  final LatLng start;
  final LatLng destination;

  RouteReady({
    required this.start,
    required this.destination,
  });

}
