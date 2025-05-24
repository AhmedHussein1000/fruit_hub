import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/login/domain/repository/base_login_repo.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';
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
        (userEntity) => emit(LoginSuccess(user:userEntity)));
  }
   @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
 Future<void> signInWithGoogle({required S localization}) async {
    emit(LoginLoading());
    final result = await baseLoginRepo.signInWithGoogle(localization: localization);
    result.fold((failure) => emit(LoginFailure(errorMessage:  failure.message)),
        (userEntity) => emit(LoginSuccess(user:userEntity)));
  }
 Future<void> signInWithFacebook({required S localization}) async {
    emit(LoginLoading());
    final result = await baseLoginRepo.signInWithFacebook(localization: localization);
    result.fold((failure) => emit(LoginFailure(errorMessage:  failure.message)),
        (userEntity) => emit(LoginSuccess(user:userEntity)));
 } 

}
