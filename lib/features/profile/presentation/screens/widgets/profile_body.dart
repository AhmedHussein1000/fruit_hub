import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/features/profile/presentation/screens/who_are_we_screen.dart';
import 'package:fruit_hub/features/profile/presentation/screens/widgets/profile_header.dart';
import 'package:fruit_hub/features/profile/presentation/screens/widgets/settings_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/features/profile/data/models/settings_item_model.dart';
import 'package:fruit_hub/features/profile/presentation/screens/widgets/general_settings_list.dart';
import 'package:fruit_hub/features/profile/presentation/screens/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const ProfileHeader(),
              const SizedBox(height: 16),
              Text(S.of(context).general, style: Styles.font13SemiBold),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      const GeneralSettingsList(),
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(S.of(context).help, style: Styles.font13SemiBold),
            ),
            const SizedBox(height: 16),
            SettingsItem(
                settingsItemModel: SettingsItemModel(
                    svgPath: Assets.imagesInfoCircle,
                    title: S.of(context).who_are_we,
                    onTap: () {
                      context.pushPersistentScreen(const WhoAreWeScreen());
                    })),
            SizedBox(height: 20.h),
            const LogoutButton(),
            SizedBox(height: 33.h),
          ],
        ),
      )
    ]);
  }
}
