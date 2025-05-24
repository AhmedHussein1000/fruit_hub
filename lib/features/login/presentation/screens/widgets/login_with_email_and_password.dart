import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/core/utils/app_constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/core/widgets/custom_password_text_field.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub/features/login/presentation/controller/login_cubit/login_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

class LoginWithEmailAndPassword extends StatefulWidget {
  const LoginWithEmailAndPassword({super.key});

  @override
  State<LoginWithEmailAndPassword> createState() =>
      _LoginWithEmailAndPasswordState();
}

class _LoginWithEmailAndPasswordState extends State<LoginWithEmailAndPassword> {
  final _formKey = GlobalKey<FormState>();

  ValueNotifier<bool> isObscure = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: loginCubit.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).emailRequired;
              }
              return null;
            },
            hintText: S.of(context).email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 16.h,
          ),
          CustomPasswordTextField(
              valueNotifierIsObscure: isObscure,
              controller: loginCubit.passwordController),
          SizedBox(
            height: AppConstants.defaultPadding.h,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: GestureDetector(
              onTap: () => context.pushNamed(Routes.forgotPassword),
              child: Text(
                S.of(context).forrgotPassword,
                style:
                    Styles.font13SemiBold.copyWith(color: AppColors.seaGreen),
              ),
            ),
          ),
          SizedBox(
            height: 33.h,
          ),
          CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context
                      .read<LoginCubit>()
                      .loginWithEmailAndPassword(localization: S.of(context));
                }
              },
              buttonText: S.of(context).login),
        ],
      ),
    );
  }
}
