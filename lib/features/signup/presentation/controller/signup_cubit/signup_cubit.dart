import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/features/signup/domain/repository/base_signup_repo.dart';
import 'package:fruit_hub/generated/l10n.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final ValueNotifier<bool> isObscure = ValueNotifier<bool>(true);
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final BaseSignupRepo baseSignupRepo;

  SignupCubit(this.baseSignupRepo) : super(SignupInitial());

  Future<void> signupWithEmailAndPassword({required S localization}) async {
    emit(SignupLoading());
    final result = await baseSignupRepo.signupWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
        localization: localization);
    result.fold((failure) => emit(SignupFailure(message: failure.message)),
        (user) => emit(SignupSuccess(user: user)));
  }
}
