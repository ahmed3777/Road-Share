import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roadshare/core/errors/failure.dart';
import 'package:roadshare/features/auth/data/models/app_user.dart';

abstract class AuthRepo {

Future<Either<Failure, AppUser>> signinWithGoogle();

 Future<Either<Failure, Unit>> verifyPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) onVerificationCompleted,
    required Function(FirebaseAuthException) onVerificationFailed,
    required Function(String verificationId, int? resendToken) onCodeSent,
    required Function(String verificationId) onCodeAutoRetrievalTimeout,
  });
   Future<Either<Failure, AppUser>> signInWithSmsCode({
    required String verificationId,
    required String smsCode,
  });

  Future addUserData({required AppUser user});
  Future saveUserData({required AppUser user});
  Future <AppUser> getUserData( {required String uid});
  Future <Either<Failure,Unit>>updateUserData({required String uid, required Map<String, dynamic> updatedFields});
}