import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';
import 'package:fruit_hub/generated/l10n.dart';

abstract class BaseProfileRepo {
  Future<Either<Failure, UserEntity>> updateUserProfile({
    required String displayName,
    required S localization,
  });

  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required S localization,
  });
}
