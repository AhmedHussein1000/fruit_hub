import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';
import 'package:fruit_hub/generated/l10n.dart';

abstract class BaseSignupRepo {
  Future<Either<Failure, UserEntity>> signupWithEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required S localization});
}
