part of 'sign_in_cubit.dart';

sealed class SignInState {}

final class SignInInitial extends SignInState {}
final class SignInLoading extends SignInState {}

final class SignInSuccess extends SignInState {
  final User user;
  SignInSuccess({required this.user});
}
final class SignInFailure extends SignInState {
  final String message;
  SignInFailure({required this.message});
}

  final class PhoneAuthCodeSent extends SignInState {
  final String verificationId;

  PhoneAuthCodeSent({required this.verificationId});
}

final class PhoneAuthVerified extends SignInState {
  final User user;

  PhoneAuthVerified({required this.user});
}

final class PhoneAuthError extends SignInState {
  final String message;

  PhoneAuthError({required this.message});
}

final class PhoneAuthLoading extends SignInState {}

final class PhoneAuthLoggedIn extends SignInState {
  final User user;

  PhoneAuthLoggedIn({required this.user});
}

