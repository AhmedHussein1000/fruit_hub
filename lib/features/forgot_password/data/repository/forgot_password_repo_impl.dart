import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/services/auth_service.dart';
import 'package:fruit_hub/features/forgot_password/domain/repository/base_forgot_password_repo.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ForgotPasswordRepoImpl implements BaseForgotPasswordRepo {
  final AuthService authService;

  ForgotPasswordRepoImpl(this.authService);

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail({
    required String email,
    required S localization,
  }) async {
    try {
      await authService.sendPasswordResetEmail(
        email: email,
        localization: localization,
      );
      return const Right(null);
    } on CustomException catch (e) {
      log('Exception in ForgotPasswordRepoImpl.sendPasswordResetEmail: ${e.toString()}');
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      log('Exception in ForgotPasswordRepoImpl.sendPasswordResetEmail: ${e.toString()}');
      return Left(ServerFailure(message: localization.unexpectedError));
    }
  }
}
