import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/custom_password_text_field.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/signup/presentation/controller/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    var signupCubit = BlocProvider.of<SignupCubit>(context);
    return Form(
      key: signupCubit.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).nameRequired;
              }
              return null;
            },
            hintText: S.of(context).fullName,
            controller: signupCubit.nameController,
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).emailRequired;
              }
              return null;
            },
            hintText: S.of(context).email,
            controller: signupCubit.emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16.h),
          CustomPasswordTextField(
              valueNotifierIsObscure: signupCubit.isObscure,
              controller: signupCubit.passwordController)
        ],
      ),
    );
  }
}
