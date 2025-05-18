import 'package:flutter/material.dart';
import 'package:fruit_hub/core/functions/get_user.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getUser();
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(Assets.imagesProfileImage, height: 73, width: 73),
      title: Text(
        user?.name ?? S.of(context).unknown,
        style: Styles.font13Bold,
      ),
      subtitle: Text(
        user?.email ?? '',
        style: Styles.font13Regular.copyWith(color: const Color(0xFF888FA0)),
      ),
    );
  }
}
