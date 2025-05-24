import 'package:flutter/material.dart';
import 'package:fruit_hub/features/profile/presentation/screens/widgets/profile_body.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
      ),
      body: const ProfileBody(),
    );
  }
}
