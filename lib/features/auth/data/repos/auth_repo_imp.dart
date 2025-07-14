import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roadshare/core/errors/failure.dart';
import 'package:roadshare/core/services/auth_service.dart';
import 'package:roadshare/features/auth/domin/repos/auth_repo.dart';

class AuthRepoImp implements AuthRepo{
    final FirebaseAuthService firebaseAuthService;

  AuthRepoImp({required this.firebaseAuthService});

  @override
  Future<Either<Failure, User>> signinWithGoogle()async {
    try{
      var user = await firebaseAuthService.signInWithGoogle();
      print("firebaseAuthService: $user");

      return Right(user);
    }catch(e){
      return Left(ServerFailure(e.toString()));

    }
  }

    @override
  Future<Either<Failure, Unit>> verifyPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) onVerificationCompleted,
    required Function(FirebaseAuthException) onVerificationFailed,
    required Function(String, int?) onCodeSent,
    required Function(String) onCodeAutoRetrievalTimeout,
  }) async {
    try {
      await firebaseAuthService.signInWithPhone(
        phoneNumber: phoneNumber,
        onVerificationCompleted: onVerificationCompleted,
        onVerificationFailed: onVerificationFailed,
        onCodeSent: onCodeSent,
        onCodeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
      );
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

      @override
    Future<Either<Failure, User>> signInWithSmsCode({
      required String verificationId,
      required String smsCode,}) async {
      try {
        final user = await firebaseAuthService.signInWithSmsCode(
          verificationId: verificationId,
          smsCode: smsCode,
        );
        return Right(user!);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    }

}