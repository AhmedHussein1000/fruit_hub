import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/show_toast.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/widgets/custom_progress_indicator_hud.dart';
import 'package:fruit_hub/features/login/presentation/controller/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/login/presentation/screens/widgets/login_body.dart';

class LoginBodyBlocConsumer extends StatelessWidget {
  const LoginBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          customToast(message:  state.errorMessage,state:  ToastStates.error);
        }
        if (state is LoginSuccess) {
          context.pushNamedAndRemoveUntil(
            Routes.mainLayout,
            predicate: (route) => false,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressIndicatorHud(
            isLoading: state is LoginLoading ? true : false,
            child: const LoginBody());
      },
    );
  }
}
