import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/features/forgot_password/presentation/controller/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:fruit_hub/features/forgot_password/presentation/screens/widgets/forgot_password_body.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(
        getIt(),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomLeadingBackButton(),
          title: Text(S.of(context).resetPassword),
        ),
        body: const ForgotPasswordBody(),
      ),
    );
  }
}
