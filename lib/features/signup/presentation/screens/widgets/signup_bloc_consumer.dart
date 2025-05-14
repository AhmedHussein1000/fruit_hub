import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/show_toast.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/widgets/custom_progress_indicator_hud.dart';
import 'package:fruit_hub/features/signup/presentation/controller/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/signup/presentation/screens/widgets/signup_body.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SignupBlocConsumer extends StatelessWidget {
  const SignupBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          customToast(message:  S.of(context).signupSuccessful,state:  ToastStates.success);
          context.pop();
        }
        if (state is SignupFailure) {
          customToast(message:  state.message,state:  ToastStates.error);
        }
      },
      builder: (context, state) {
        return CustomProgressIndicatorHud(
          isLoading: state is SignupLoading ? true : false,
          child: const SignupBody(),
        );
      },
    );
  }
}
