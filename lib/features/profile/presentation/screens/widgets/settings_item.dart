import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/features/profile/data/models/settings_item_model.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key, required this.settingsItemModel,
  });
  final SettingsItemModel settingsItemModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:settingsItemModel.onTap,
      child: ListTile(
        leading: SvgPicture.asset(
         settingsItemModel.svgPath,
          height: 20,
          width: 20,
        ),
        title: Text(
         settingsItemModel.title,
          style: Styles.font13SemiBold
              .copyWith(color: AppColors.mediumNeutralGray),
        ),
        trailing: settingsItemModel.trailing ??
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
      ),
    );
  }
}
