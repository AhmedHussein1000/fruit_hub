import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/functions/user_functions/add_user_data.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/firebase_firestore_service.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/signup/domain/repository/base_signup_repo.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SignupRepoImpl extends BaseSignupRepo {
  final FirebaseAuthService firebaseAuthService;
  final FirestoreService firestoreService;

  SignupRepoImpl(this.firebaseAuthService, this.firestoreService);
  @override
  Future<Either<Failure, UserEntity>> signupWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required S localization}) async {
    User? user;
    try {
      user = await firebaseAuthService.signupWithEmailAndPassword(
          email: email, password: password, localization: localization);
      UserEntity userEntity =
          UserEntity(userId: user.uid, name: name, email: email);

      await addUserData(userEntity:  userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await firebaseAuthService.deleteUser(user);
      
      return Left(ServerFailure(message: e.message));
    } catch (e) {
            await firebaseAuthService.deleteUser(user);

      log('{Exception in SignupRepoImpl.signupWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure(message: localization.unexpectedError));
    }
  }

  

}
