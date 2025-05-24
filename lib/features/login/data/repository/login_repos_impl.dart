import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/functions/user_functions/cache_user_data.dart';
import 'package:fruit_hub/core/functions/user_functions/get_user_from_server.dart';
import 'package:fruit_hub/core/functions/user_functions/is_user_data_exist.dart';
import 'package:fruit_hub/core/services/auth_service.dart';
import 'package:fruit_hub/features/login/domain/repository/base_login_repo.dart';
import 'package:fruit_hub/features/signup/data/models/user_model.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';
import 'package:fruit_hub/generated/l10n.dart';

class LoginReposImpl extends BaseLoginRepo {
  final AuthService authService;
  LoginReposImpl(this.authService);
  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      {required String email,
      required String password,
      required S localization}) async {
    try {
      User user = await authService.loginWithEmailAndPassword(
          email: email, password: password, localization: localization);
      UserEntity userEntity = await getUserDataFromServer(uid: user.uid);
      await cacheUserData(userEntity);
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
      user = await authService.signInWithGoogle(
          localization: localization);
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      await isUserDataExist(userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await authService.deleteUser(user);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      await authService.deleteUser(user);
      log('{Exception in LoginReposImpl.signInWithGoogle: ${e.toString()}');
      return Left(ServerFailure(message: localization.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook(
      {required S localization}) async {
    User? user;
    try {
      user = await authService.signInWithFacebook(
          localization: localization);
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      await isUserDataExist(userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await authService.deleteUser(user);
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      await authService.deleteUser(user);
      log('{Exception in LoginReposImpl.signInWithFacebook: ${e.toString()}');
      return Left(ServerFailure(message: localization.unexpectedError));
    }
  }

 


}
