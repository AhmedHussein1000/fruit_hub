import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/user_functions/get_cached_user.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/core/widgets/notification_widget.dart';
import 'package:fruit_hub/features/profile/presentation/controller/personal_info_cubit/personal_info_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
      builder: (context, state) {
        final user = getCachedUser();

        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading:
              Image.asset(Assets.imagesProfileImage, height: 44, width: 44),
          title: Text(
            S.of(context).goodMorning,
            style: Styles.font16Regular
                .copyWith(color: AppColors.mediumNeutralGray),
          ),
          subtitle: Text(
            user?.name ?? S.of(context).unknown,
            style: Styles.font16Bold,
          ),
          trailing: const NotificationWidget(),
        );
      },
    );
  }
}
