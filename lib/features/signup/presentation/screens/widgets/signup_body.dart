import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/functions/show_toast.dart';
import 'package:fruit_hub/core/utils/app_constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/signup/presentation/controller/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/signup/presentation/screens/widgets/already_have_an_account.dart';
import 'package:fruit_hub/features/signup/presentation/screens/widgets/signup_form.dart';
import 'package:fruit_hub/features/signup/presentation/screens/widgets/terms_and_conditions.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  ValueNotifier<bool> isChecked = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    var signupCubit = context.read<SignupCubit>();
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding),
          child: Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              const SignupForm(),
              SizedBox(
                height: 16.h,
              ),
              ValueListenableBuilder(
                  valueListenable: isChecked,
                  builder: (context, value, child) {
                    log('terms value: ${value.toString()}');
                    return TermsAndConditions(
                      isChecked: value,
                      onTap: () {
                        isChecked.value = !isChecked.value;
                      },
                    );
                  }),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                  onPressed: () {
                    if (signupCubit.formKey.currentState!.validate()) {
                      if (isChecked.value == true) {
                        signupCubit.signupWithEmailAndPassword(
                            localization: S.of(context));
                      } else {
                        customToast(
                            message: S.of(context).pleaseAcceptTerms,
                            state: ToastStates.error);
                      }
                    }
                  },
                  btnText: S.of(context).createAccount),
              SizedBox(
                height: 26.h,
              ),
              const AlreadyHaveAnAccount(),
            ],
          ),
        ));
  }
}
