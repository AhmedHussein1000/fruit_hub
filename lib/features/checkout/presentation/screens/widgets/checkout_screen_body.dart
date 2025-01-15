import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/checkout_steps.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/checkout_steps_pageview.dart';
import 'package:fruit_hub/generated/l10n.dart';

class CheckoutScreenBody extends StatefulWidget {
  const CheckoutScreenBody({super.key});

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          CheckoutSteps(currentIndex: currentIndex),
          SizedBox(
            height: 32.h,
          ),
          Expanded(
              child: CheckoutStepsPageview(
            pageController: pageController,
          )),
          CustomButton(
              onPressed: () {
                if (currentIndex == 0) {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                }
              },
              btnText: _getBtnText(currentIndex: currentIndex)),
          SizedBox(
            height: 32.h,
          ),
        ],
      ),
    );
  }

  String _getBtnText({required int currentIndex}) {
    switch (currentIndex) {
      case 0:
        return S.of(context).next;
      case 1:
        return S.of(context).next;
      case 2:
        return S.of(context).paypalPayment;
      default:
        return S.of(context).next;
    }
  }
}
