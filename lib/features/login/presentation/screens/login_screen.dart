import 'package:flutter/material.dart';
import 'package:fruit_hub/features/login/presentation/screens/widgets/login_body_bloc_consumer.dart';
import 'package:fruit_hub/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(S.of(context).login)),
      body: const LoginBodyBlocConsumer(),
    );
  }
}
