import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roadshare/core/errors/failure.dart';

abstract class AuthRepo {

Future<Either<Failure, User>> signinWithGoogle();

 Future<Either<Failure, Unit>> verifyPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) onVerificationCompleted,
    required Function(FirebaseAuthException) onVerificationFailed,
    required Function(String verificationId, int? resendToken) onCodeSent,
    required Function(String verificationId) onCodeAutoRetrievalTimeout,
  });
   Future<Either<Failure, User>> signInWithSmsCode({
    required String verificationId,
    required String smsCode,
  });
}