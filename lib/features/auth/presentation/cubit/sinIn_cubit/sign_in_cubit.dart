import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/features/auth/domin/repos/auth_repo.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo _authRepo;
  SignInCubit(this._authRepo) : super(SignInInitial());

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoading());
    final result = await _authRepo.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      onVerificationCompleted: (credential) {
        // This is for auto-retrieval. Usually, the user will enter the code manually.
        // We don't need to do anything here for this flow.
      },
      onVerificationFailed: (e) {
        emit(PhoneAuthError('Verification failed: ${e.message}'));
      },
      onCodeSent: (verificationId, resendToken) {
        emit(PhoneAuthCodeSent(verificationId: verificationId));
      },
      onCodeAutoRetrievalTimeout: (verificationId) {
        // You can handle timeout if needed.
      },
    );

    result.fold(
      (failure) => emit(PhoneAuthError(failure.errMessage)),
      (_) => null, // Success is handled by the onCodeSent callback
    );
  }

  Future<void> verifyOtp(String verificationId, String otp) async {
    emit(PhoneAuthLoading());
    final result = await _authRepo.signInWithSmsCode(
      verificationId: verificationId,
      smsCode: otp,
    );
    result.fold(
      (failure) => emit(PhoneAuthError(failure.errMessage)),
      (user) {
        // Convert AppUser to AuthUser before emitting the state.
      
        emit(PhoneAuthVerified( user));
      },
    );
  }


  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());
    final result = await _authRepo.signinWithGoogle();
    result.fold(
      (failure) => emit(GoogleSignInFailure(message: failure.errMessage)),
      (appUser) {
        // Convert AppUser to AuthUser before emitting the state.
        emit(GoogleSignInSuccess(user: appUser));
      },
    );
  }

  

}
