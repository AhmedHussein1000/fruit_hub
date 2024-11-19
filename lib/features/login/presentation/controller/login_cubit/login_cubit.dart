import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/login/domain/repository/login_repos.dart';
import 'package:fruit_hub/generated/l10n.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final BaseLoginRepo baseLoginRepo;
  LoginCubit(this.baseLoginRepo) : super(LoginInitial());
  Future<void> loginWithEmailAndPassword(
      {
      required S localization}) async {
    emit(LoginLoading());
    final result = await baseLoginRepo.loginWithEmailAndPassword(
        email: emailController.text, password: passwordController.text, localization: localization);
    result.fold((failure) => emit(LoginFailure(errorMessage:  failure.message)),
        (user) => emit(LoginSuccess(user:user)));
  }
   @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
