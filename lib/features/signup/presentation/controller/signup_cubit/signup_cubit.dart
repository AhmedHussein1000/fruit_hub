import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final ValueNotifier<bool> isObscure = ValueNotifier<bool>(true);
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
   final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  SignupCubit() : super(SignupInitial());
}
