import 'package:flutter/material.dart';
import 'package:fruit_hub/core/themes/styles.dart';

class CustomTextMessage extends StatelessWidget {
  const CustomTextMessage({
    super.key, required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: Styles.font16SemiBold,
        textAlign: TextAlign.center,
      ),
    );
  }
}
