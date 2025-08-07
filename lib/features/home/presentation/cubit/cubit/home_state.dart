part of 'home_cubit.dart';

sealed class HomeState  {
  @override
  List<Object?> get props => [];
}



final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState {}
final class HomeFailure extends HomeState {
  final String errorMessage;
  HomeFailure({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
final class HomeSuccess extends HomeState {
  final Position position;
  final String? errorMessage;
  HomeSuccess({required this.position, this.errorMessage});
  @override
  List<Object?> get props => [position, errorMessage];
}
