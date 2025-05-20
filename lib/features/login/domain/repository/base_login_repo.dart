import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';
import 'package:fruit_hub/generated/l10n.dart';

abstract class BaseLoginRepo {
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      {required String email,
      required String password,
      required S localization});
  Future<Either<Failure, UserEntity>> signInWithGoogle(
      {required S localization});
  Future<Either<Failure, UserEntity>> signInWithFacebook(
      {required S localization});
}
