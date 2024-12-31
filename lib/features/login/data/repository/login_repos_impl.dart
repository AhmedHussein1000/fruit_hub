import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/functions/add_user_data.dart';
import 'package:fruit_hub/core/helpers/cache_helper.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/firebase_firestore_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';
import 'package:fruit_hub/features/login/domain/repository/base_login_repo.dart';
import 'package:fruit_hub/features/signup/data/models/user_model.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';
import 'package:fruit_hub/generated/l10n.dart';

class LoginReposImpl extends BaseLoginRepo {
  final FirebaseAuthService firebaseAuthService;
  final FirestoreService firestoreService;
  LoginReposImpl(this.firebaseAuthService, this.firestoreService);
  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      {required String email,
      required String password,
      required S localization}) async {
    try {
      User user = await firebaseAuthService.loginWithEmailAndPassword(
          email: email, password: password, localization: localization);
      UserEntity userEntity = await getUserData(uid: user.uid);
      saveUserData(userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      log('{Exception in LoginReposImpl.loginWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure(message: localization.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle(
      {required S localization}) async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle(
          localization: localization);
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      await isUserDataExist(userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await firebaseAuthService.deleteUser(user);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      await firebaseAuthService.deleteUser(user);
      log('{Exception in LoginReposImpl.signInWithGoogle: ${e.toString()}');
      return Left(ServerFailure(message: localization.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook(
      {required S localization}) async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook(
          localization: localization);
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      await isUserDataExist(userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await firebaseAuthService.deleteUser(user);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      await firebaseAuthService.deleteUser(user);
      log('{Exception in LoginReposImpl.signInWithFacebook: ${e.toString()}');
      return Left(ServerFailure(message: localization.unexpectedError));
    }
  }

  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await firestoreService.getData(
        path: BackendEndpoints.getUserData, docId: uid);
    UserEntity userEntity = UserModel.fromJson(userData);

    return userEntity;
  }

  Future<void> isUserDataExist(UserEntity userEntity) async {
    bool isDataExist = await firestoreService.checkIfDataExist(
        path: BackendEndpoints.isUserExist, docId: userEntity.userId);
    if (isDataExist) {
      await getUserData(uid: userEntity.userId);
            saveUserData(userEntity);

    } else {
      await addUserData(userEntity: userEntity);
    }
  }

  Future saveUserData(UserEntity userEntity) async {
    var jsonData = jsonEncode(UserModel.fromUserEntity(userEntity).toJson());

    await CacheHelper.saveData(key: CacheHelper.userDataKey, value: jsonData);
  }
}
