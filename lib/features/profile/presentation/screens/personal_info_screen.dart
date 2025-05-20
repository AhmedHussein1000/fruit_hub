import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:fruit_hub/core/functions/show_toast.dart';
import 'package:fruit_hub/core/functions/user_functions/get_cached_user.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_circle_progress_indicator.dart';
import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/core/widgets/custom_password_text_field.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/profile/presentation/controller/personal_info_cubit/personal_info_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _currentPasswordObscure = ValueNotifier<bool>(true);
  final _newPasswordObscure = ValueNotifier<bool>(true);
  final _confirmPasswordObscure = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    final currentUser = getCachedUser();
    if (currentUser != null) {
      _nameController.text = currentUser.name;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _currentPasswordObscure.dispose();
    _newPasswordObscure.dispose();
    _confirmPasswordObscure.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalInfoCubit(getIt()),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomLeadingBackButton(),
          title: Text(S.of(context).personal_file),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).personal_information,
                    style: Styles.font16SemiBold,
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    controller: _nameController,
                    hintText: S.of(context).fullName,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).change_password,
                    style: Styles.font16SemiBold,
                  ),
                  const SizedBox(height: 8),
                  CustomPasswordTextField(
                    valueNotifierIsObscure: _currentPasswordObscure,
                    controller: _currentPasswordController,
                    hintText: S.of(context).current_password,
                  ),
                  const SizedBox(height: 8),
                  CustomPasswordTextField(
                    valueNotifierIsObscure: _newPasswordObscure,
                    controller: _newPasswordController,
                    hintText: S.of(context).new_password,
                  ),
                  const SizedBox(height: 8),
                  CustomPasswordTextField(
                    valueNotifierIsObscure: _confirmPasswordObscure,
                    controller: _confirmPasswordController,
                    hintText: S.of(context).confirm_password,
                  ),
                  const SizedBox(height: 32),
                  UpdateProfileButtonBlocConsumer(
                      formKey: _formKey,
                      nameController: _nameController,
                      currentPasswordController: _currentPasswordController,
                      newPasswordController: _newPasswordController,
                      confirmPasswordController: _confirmPasswordController),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UpdateProfileButtonBlocConsumer extends StatelessWidget {
  const UpdateProfileButtonBlocConsumer({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController currentPasswordController,
    required TextEditingController newPasswordController,
    required TextEditingController confirmPasswordController,
  })  : _formKey = formKey,
        _nameController = nameController,
        _currentPasswordController = currentPasswordController,
        _newPasswordController = newPasswordController,
        _confirmPasswordController = confirmPasswordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _nameController;
  final TextEditingController _currentPasswordController;
  final TextEditingController _newPasswordController;
  final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
      listener: (context, state) {
        if (state is PersonalInfoSuccess) {
          customToast(
              message: S.of(context).changes_saved_successfully,
              state: ToastStates.success);
          context.pop();
        } else if (state is PersonalInfoError) {
          customToast(message: state.message, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        return state is PersonalInfoLoading
            ? const CustomCircleProgressIndicator()
            : SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<PersonalInfoCubit>().updateUserInfo(
                            name: _nameController.text,
                            currentPassword: _currentPasswordController.text,
                            newPassword: _newPasswordController.text,
                            confirmPassword: _confirmPasswordController.text,
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
