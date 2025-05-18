import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/generated/l10n.dart';

Future<void> customDialog(
    {required BuildContext context,
    required VoidCallback onConfirm,
    required String title}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close, size: 20),
                  color: AppColors.charcoalBlack),
              const SizedBox(height: 12),
              Text(
                title,
                style:
                    Styles.font16Bold.copyWith(color: AppColors.charcoalBlack),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: AppColors.darkGreenPrimaryColor,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Text(
                        S.of(context).cancel,
                        style: Styles.font16Bold
                            .copyWith(color: AppColors.darkGreenPrimaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                        onConfirm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkGreenPrimaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        S.of(context).confirm,
                        style: Styles.font16Bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
