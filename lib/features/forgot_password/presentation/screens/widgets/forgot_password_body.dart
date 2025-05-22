
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/show_toast.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_circle_progress_indicator.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/forgot_password/presentation/controller/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Text(
            S.of(context).resetPasswordInstructions,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            controller: cubit.emailController,
            hintText: S.of(context).email,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 30),
          BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ForgotPasswordSuccess) {
                customToast(message: state.message, state: ToastStates.success);
              } else if (state is ForgotPasswordFailure) {
                customToast(
                    message: state.errorMessage, state: ToastStates.error);
              }
            },
            builder: (context, state) {
              return state is ForgotPasswordLoading
                  ? const CustomCircleProgressIndicator()
                  : CustomButton(
                      onPressed: () {
                        cubit.sendPasswordResetEmail(
                            localization: S.of(context));
                      },
                      buttonText: S.of(context).sendResetLink,
                    );
            },
          )
        ],
      ),
    );
  }
}
