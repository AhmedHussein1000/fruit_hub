import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/login/domain/repository/base_login_repo.dart';
import 'package:fruit_hub/generated/l10n.dart';

class LoginReposImpl extends BaseLoginRepo {
  final FirebaseAuthService firebaseAuthService;

  LoginReposImpl(this.firebaseAuthService);
  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword(
      {required String email,
      required String password,
      required S localization}) async {
    try {
      User user = await firebaseAuthService.loginWithEmailAndPassword(
          email: email, password: password, localization: localization);

      return Right(user);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      log('{Exception in LoginReposImpl.loginWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure(message: localization.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle(
      {required S localization}) async {
    try {
      User user = await firebaseAuthService.signInWithGoogle(
          localization: localization);
      return Right(user);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      log('{Exception in LoginReposImpl.signInWithGoogle: ${e.toString()}');
      return Left(ServerFailure(message: localization.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithFacebook(
      {required S localization}) async {
    try {
      User user = await firebaseAuthService.signInWithFacebook(
          localization: localization);
      return Right(user);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on Exception catch (e) {
      log('{Exception in LoginReposImpl.signInWithFacebook: ${e.toString()}');
      return Left(ServerFailure(message: localization.unexpectedError));
    }
  }
}
