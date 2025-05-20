import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/user_functions/get_cached_user.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/features/profile/presentation/controller/personal_info_cubit/personal_info_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
      builder: (context, state) {
        final user = getCachedUser();
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading:
              Image.asset(Assets.imagesProfileImage, height: 73, width: 73),
          title: Text(
            user?.name ?? S.of(context).unknown,
            style: Styles.font16SemiBold,
          ),
          subtitle: Text(
            user?.email ?? '',
            style:
                Styles.font13Regular.copyWith(color: const Color(0xFF888FA0)),
          ),
        );
      },
    );
  }
}
