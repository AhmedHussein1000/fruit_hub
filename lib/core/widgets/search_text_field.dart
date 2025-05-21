import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/features/search/presentation/screens/search_screen.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
        context.pushPersistentScreen(const SearchScreen())
      ,
      child: Container(
        height: 40,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.lighterGray,
              blurRadius: 9,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.text,
          enabled: false, 
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
            prefixIcon: SizedBox(
              height: 20,
              width: 20,
              child: Center(
                child: SvgPicture.asset(
                  Assets.imagesSearch,
                ),
              ),
            ),
            hintText: S.of(context).searchFor,
            hintStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.mediumNeutralGray),
        ),
      ),
    ));
  }

  OutlineInputBorder buildBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(
          color: Colors.transparent,
        ));
  }
}
