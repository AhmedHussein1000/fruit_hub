import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/features/forgot_password/domain/repository/base_forgot_password_repo.dart';
import 'package:fruit_hub/generated/l10n.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final BaseForgotPasswordRepo baseForgotPasswordRepo;
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordCubit(this.baseForgotPasswordRepo)
      : super(ForgotPasswordInitial());

  Future<void> sendPasswordResetEmail({required S localization}) async {
    emit(ForgotPasswordLoading());
    final result = await baseForgotPasswordRepo.sendPasswordResetEmail(
      email: emailController.text,
      localization: localization,
    );
    result.fold(
      (failure) => emit(ForgotPasswordFailure(errorMessage: failure.message)),
      (_) => emit(
          ForgotPasswordSuccess(message: localization.passwordResetEmailSent)),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
