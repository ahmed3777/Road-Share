import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roadshare/core/errors/failure.dart';
import 'package:roadshare/core/services/auth_service.dart';
import 'package:roadshare/core/services/database_services.dart';
import 'package:roadshare/core/utils/constants.dart';
import 'package:roadshare/features/auth/data/models/app_user.dart';
import 'package:roadshare/features/auth/domin/repos/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseServices databaseServices;
  AppUser? _currentUser;

  AuthRepoImp({required this.firebaseAuthService,
    required this.databaseServices,
  });

  @override
  Future<Either<Failure, AppUser>> signinWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      var appUser = AppUser.fromFirebaseUser(user);

      final isUserExist = await databaseServices.ifDataExists(
        path: FirebaseCollectionName.users,
        documentId: appUser.uid,
      );
      if (!isUserExist) {
        await addUserData(user: appUser);
      } else {
        final existingUser =  await getUserData(uid: appUser.uid);
        _currentUser = existingUser; // تخزينه هنا

        return Right(existingUser);

      //  await  updateUserData(uid: appUser.uid, updatedFields: appUser.toJson()); 
      }
             _currentUser = appUser; // تخزينه هنا


      return Right(appUser);
    } catch (e) {
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
        phoneNumber: "+2"+phoneNumber,
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
  Future<Either<Failure, AppUser>> signInWithSmsCode({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final user = await firebaseAuthService.signInWithSmsCode(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      if (user == null) {
        return Left(ServerFailure('User not found'));
      }
      
       // Convert Firebase User to AppUser
        final appUser = AppUser.fromFirebaseUser(user);
        final isUserExist = await databaseServices.ifDataExists(
          path: FirebaseCollectionName.users,
          documentId: appUser.uid,
        );
        if (!isUserExist) {
          await addUserData(user: appUser);
        } else {
         final existingUser = await getUserData(uid: appUser.uid);
          return Right(existingUser);
        }
        // Save user data to Firestore
      
      return Right(appUser);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future addUserData({required AppUser user}) async {
    await databaseServices.addData(
      path: FirebaseCollectionName.users,
      data: user.toJson(),
      documentId: user.uid ,
    );
  }

  @override
  Future<AppUser> getUserData({required String uid}) async {
    var data = await databaseServices.getData(
      path: FirebaseCollectionName.users,
      documentId: uid,
    );
    return AppUser.fromJson(data);
  }

  @override
  Future saveUserData({required AppUser user}) async {
    await databaseServices.addData(
      path: FirebaseCollectionName.users,
      data: user.toJson(),
      documentId: user.uid,
    );
  }

  @override
  Future <Either<Failure,Unit>> updateUserData({
    required String uid,
    required Map<String, dynamic> updatedFields,
  }) async {
    try{
    await databaseServices.updateData(
      path: FirebaseCollectionName.users,
      documentId: uid,
      data: updatedFields,
    );
    return right(unit);
  } catch (e){
        return Left(ServerFailure(e.toString()));

  }
}

  @override
  // TODO: implement currentUser
  AppUser? get currentUser => _currentUser ;
}