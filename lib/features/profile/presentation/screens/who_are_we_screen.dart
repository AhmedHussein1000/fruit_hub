import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/generated/l10n.dart';

class WhoAreWeScreen extends StatelessWidget {
  const WhoAreWeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomLeadingBackButton(),
        title: Text(S.of(context).who_are_we),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            SvgPicture.asset(
              Assets.imagesFruitLogo,
              height: 120,
            ),
            const SizedBox(height: 40),
            Text(
              S.of(context).who_are_we_content,
              style: Styles.font19Bold.copyWith(
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
