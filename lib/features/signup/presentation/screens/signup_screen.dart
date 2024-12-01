import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/features/signup/presentation/screens/widgets/signup_bloc_consumer.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomLeadingButton(),
        title: Text(S.of(context).newAccount),
      ),
      body: const SignupBlocConsumer(),
    );
  }
}
