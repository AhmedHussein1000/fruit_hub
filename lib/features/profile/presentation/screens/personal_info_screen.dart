import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/functions/user_functions/get_cached_user.dart';
import 'package:fruit_hub/core/themes/styles.dart';

import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/core/widgets/custom_password_text_field.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/profile/presentation/screens/widgets/change_password_button_bloc_consumer.dart';
import 'package:fruit_hub/features/profile/presentation/screens/widgets/update_profile_button_bloc_consumer.dart';
import 'package:fruit_hub/generated/l10n.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _profileFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
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
    return Scaffold(
      appBar: AppBar(
        leading: const CustomLeadingBackButton(),
        title: Text(S.of(context).personal_file),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).personal_information,
                style: Styles.font16SemiBold,
              ),
              const SizedBox(height: 8),
              Form(
                key: _profileFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _nameController,
                      hintText: S.of(context).fullName,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 16.h),
                    UpdateProfileButtonBlocConsumer(
                      formKey: _profileFormKey,
                      nameController: _nameController,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                S.of(context).change_password,
                style: Styles.font16SemiBold,
              ),
              const SizedBox(height: 8),
              Form(
                key: _passwordFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    CustomPasswordTextField(
                      valueNotifierIsObscure: _currentPasswordObscure,
                      controller: _currentPasswordController,
                      hintText: S.of(context).current_password,
                    ),
                    SizedBox(height: 8.h),
                    CustomPasswordTextField(
                      valueNotifierIsObscure: _newPasswordObscure,
                      controller: _newPasswordController,
                      hintText: S.of(context).new_password,
                    ),
                    SizedBox(height: 8.h),
                    CustomPasswordTextField(
                      valueNotifierIsObscure: _confirmPasswordObscure,
                      controller: _confirmPasswordController,
                      hintText: S.of(context).confirm_password,
                    ),
                    SizedBox(height: 16.h),
                    ChangePasswordButtonBlocConsumer(
                      formKey: _passwordFormKey,
                      currentPasswordController: _currentPasswordController,
                      newPasswordController: _newPasswordController,
                      confirmPasswordController: _confirmPasswordController,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
