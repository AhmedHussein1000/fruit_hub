import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/profile/data/models/settings_item_model.dart';
import 'package:fruit_hub/features/profile/presentation/screens/widgets/settings_item.dart';
import 'package:fruit_hub/generated/l10n.dart';

class GeneralSettingsList extends StatelessWidget {
  const GeneralSettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const CustomDivider(
        color: AppColors.offWhite,
        height: 8,
      ),
      itemCount: _settingsItems(context).length,
      itemBuilder: (context, index) => SettingsItem(
        settingsItemModel: _settingsItems(context)[index],
      ),
    );
  }

  List<SettingsItemModel> _settingsItems(BuildContext context) => [
        SettingsItemModel(
          svgPath: Assets.imagesUser,
          title: S.of(context).personal_file,
          onTap: () {},
        ),
        SettingsItemModel(
          svgPath: Assets.imagesHeart,
          title: S.of(context).favorites,
          onTap: () {},
        ),
        SettingsItemModel(
          svgPath: Assets.imagesGlobal,
          title: S.of(context).language,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).arabic,
                style: Styles.font13Regular,
              ),
              const SizedBox(
                width: 2,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              )
            ],
          ),
          onTap: () {},
        ),
        SettingsItemModel(
          svgPath: Assets.imagesMagicpen,
          title: S.of(context).theme,
          trailing: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, state) {
              return SizedBox(
                width: 60,
                child: Switch(
                  value: state == ThemeMode.dark,
                  onChanged: (value) {
                    context.read<ThemeCubit>().changeTheme();
                  },
                  
                ),
              );
            },
          ),
        ),
      ];
}
