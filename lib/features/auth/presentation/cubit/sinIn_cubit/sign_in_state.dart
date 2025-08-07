
import 'package:roadshare/features/auth/data/models/app_user.dart';

abstract class SignInState  {
  const SignInState();

}

class SignInInitial extends SignInState {}

class PhoneAuthLoading extends SignInState {}

class PhoneAuthError extends SignInState {
  final String message;
  const PhoneAuthError(this.message);

}

class PhoneAuthCodeSent extends SignInState {
  final String verificationId;
  const PhoneAuthCodeSent({required this.verificationId});

}
class PhoneAuthVerified extends SignInState {
  final AppUser user;
  const PhoneAuthVerified(this.user);
}

class GoogleSignInLoading extends SignInState {}

class GoogleSignInSuccess extends SignInState {
  final AppUser user;
  const GoogleSignInSuccess({required this.user});

}
class GoogleSignInFailure extends SignInState {
  final String message;
  const GoogleSignInFailure({required this.message});
}

