import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/generated/l10n.dart';

abstract class BaseForgotPasswordRepo {
  Future<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
    required S localization,
  });
}
