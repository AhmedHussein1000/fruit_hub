import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/show_toast.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_circle_progress_indicator.dart';
import 'package:fruit_hub/features/profile/presentation/controller/personal_info_cubit/personal_info_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

class UpdateProfileButtonBlocConsumer extends StatelessWidget {
  const UpdateProfileButtonBlocConsumer({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
  })  : _formKey = formKey,
        _nameController = nameController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
      buildWhen: (previous, current) =>
          current is ProfileUpdateLoading ||
          current is ProfileUpdateSuccess ||
          current is ProfileUpdateError,
      listener: (context, state) {
        if (state is ProfileUpdateSuccess) {
          customToast(
              message: S.of(context).changes_saved_successfully,
              state: ToastStates.success);
        } else if (state is ProfileUpdateError) {
          customToast(message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        return state is ProfileUpdateLoading
            ? const CustomCircleProgressIndicator()
            : SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<PersonalInfoCubit>().updateUserProfile(
                            name: _nameController.text,
                            localization: S.of(context),
                          );
                    }
                  },
                  buttonText: S.of(context).save_changes,
                ),
              );
      },
    );
  }
}
