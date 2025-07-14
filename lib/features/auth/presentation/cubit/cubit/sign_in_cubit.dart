import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roadshare/features/auth/domin/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
    final AuthRepo authRepo;

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signinWithGoogle();
    result.fold((l) => emit(SignInFailure(message: l.errMessage)),
     (r) => emit(SignInSuccess(user: r)));
     print ("Google user: $result");
    }

      Future<void> verifyPhoneNumber(String phoneNumber) async {
        print("verifyPhoneNumber from cubit: $phoneNumber");
        emit(PhoneAuthLoading());
        final result = await authRepo.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          onVerificationCompleted: (credential) async {
            final userResult = await FirebaseAuth.instance.signInWithCredential(credential);
            emit(PhoneAuthVerified(user: userResult.user!));
            print("PhoneAuthVerified: $userResult");
          },
          onVerificationFailed: (e) {
            emit(PhoneAuthError(message: e.message ?? "Unknown error"));
            print("PhoneAuthError: $e");
          },
          onCodeSent: (verificationId, _) {
            emit(PhoneAuthCodeSent(verificationId: verificationId));
          },
          onCodeAutoRetrievalTimeout: (verificationId) {
            emit(PhoneAuthCodeSent(verificationId: verificationId));
          },
        );
        result.fold(
          (l) => emit(PhoneAuthError(message: l.errMessage)),
          (r) => null,
        );
      }

      Future<void> signInWithSmsCode({
      required String verificationId,
      required String smsCode}) async {

      emit(PhoneAuthLoading());
      final result = await authRepo.signInWithSmsCode(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      result.fold(
        (l) => emit(PhoneAuthError(message: l.errMessage)),
        (r) => emit(PhoneAuthLoggedIn(user: r)),
      );
    }

}
