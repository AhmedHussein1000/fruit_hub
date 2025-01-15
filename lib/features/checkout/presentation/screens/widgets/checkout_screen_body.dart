import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/checkout_steps.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w), 
      child: Column(
        children: [
          SizedBox(
            height: 16.h,),
            const CheckoutSteps(),
            SizedBox(height: 32.h,)
        ],
      ),
    );
  }
}