import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/styles.dart';
import 'package:fruit_hub/core/widgets/notification_widget.dart';
import 'package:fruit_hub/generated/l10n.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(Assets.imagesProfileImage, height: 44, width: 44),
      title: Text(
        S.of(context).goodMorning,
        style:
            Styles.font16Regular.copyWith(color: AppColors.mediumNeutralGray),
      ),
      subtitle: Text(
        S.of(context).ahmedHussein,
        style: Styles.font16Bold,
      ),
      trailing: const NotificationWidget(),
    );
  }
}