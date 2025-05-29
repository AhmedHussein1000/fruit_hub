import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/features/profile/presentation/controllers/personal_info_cubit/personal_info_cubit.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_circle_progress_indicator.dart';
import 'package:fruit_hub/core/functions/show_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ChangePasswordButtonBlocConsumer extends StatelessWidget {
  const ChangePasswordButtonBlocConsumer({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController currentPasswordController,
    required TextEditingController newPasswordController,
    required TextEditingController confirmPasswordController,
  })  : _formKey = formKey,
        _currentPasswordController = currentPasswordController,
        _newPasswordController = newPasswordController,
        _confirmPasswordController = confirmPasswordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _currentPasswordController;
  final TextEditingController _newPasswordController;
  final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
      buildWhen: (previous, current) =>
          current is PasswordChangeLoading ||
          current is PasswordChangeSuccess ||
          current is PasswordChangeError,
      listener: (context, state) {
        if (state is PasswordChangeSuccess) {
          customToast(
              message: S.of(context).passwordChangedSuccessfully,
              state: ToastStates.success);
          context.pop();
        } else if (state is PasswordChangeError) {
          customToast(message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        return state is PasswordChangeLoading
            ? const CustomCircleProgressIndicator()
            : SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<PersonalInfoCubit>().changePassword(
                            currentPassword: _currentPasswordController.text,
                            newPassword: _newPasswordController.text,
                            confirmPassword: _confirmPasswordController.text,
                            localization: S.of(context),
                          );
                    }
                  },
                  buttonText: S.of(context).change_password,
                ),
              );
      },
    );
  }
}
