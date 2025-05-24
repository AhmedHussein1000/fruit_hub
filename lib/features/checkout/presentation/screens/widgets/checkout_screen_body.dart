import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/functions/show_toast.dart';
import 'package:fruit_hub/core/helpers/extensions.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/utils/app_keys.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/cart/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/checkout/data/models/paypal_payment_model/paypal_payment_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/controllers/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/checkout_steps_widgets/checkout_steps.dart';
import 'package:fruit_hub/features/checkout/presentation/screens/widgets/checkout_steps_pageview.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:provider/provider.dart';

class CheckoutScreenBody extends StatefulWidget {
  const CheckoutScreenBody({super.key});

  @override
  State<CheckoutScreenBody> createState() => _CheckoutScreenBodyState();
}

class _CheckoutScreenBodyState extends State<CheckoutScreenBody> {
  late PageController pageController;
  int currentIndex = 0;
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> valueNotifierAutovalidateMode =
      ValueNotifier(AutovalidateMode.disabled);
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
          CheckoutSteps(
            currentIndex: currentIndex,
            onStepTapped: (index) {
              if (index == currentIndex) {
                return;
              } else if (index < currentIndex) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else {
                if (index == 1) {
                  _handleShippingSectionValidation(context);
                }
                if (index == 2) {
                  _handleShippingSectionValidation(context);

                  _handleAddressInputsValidation();
                }
              }
            },
          ),
          Expanded(
              child: CheckoutStepsPageview(
            pageController: pageController,
            formKey: _formKey,
            valueListenableAutovalidateMode: valueNotifierAutovalidateMode,
          )),
          CustomButton(
              onPressed: () {
                if (currentIndex == 0) {
                  _handleShippingSectionValidation(context);
                } else if (currentIndex == 1) {
                  _handleAddressInputsValidation();
                } else {
                  _processPaypalPayment(context);
                }
              },
              buttonText: _getBtnText(currentIndex: currentIndex)),
          SizedBox(
            height: 32.h,
          ),
        ],
      ),
    );
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      customToast(
          message: S.of(context).select_payment_method,
          state: ToastStates.warning);
    }
  }

  void _handleAddressInputsValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    } else {
      valueNotifierAutovalidateMode.value = AutovalidateMode.always;
    }
  }

  void _processPaypalPayment(BuildContext context) {
    void backToHomeScreen() {
      context.pushNamedAndRemoveUntil(
        Routes.mainLayout,
        predicate: (route) => false,
      );
    }

    S localization = S.of(context);
    OrderEntity orderEntity = context.read<OrderEntity>();
    PaypalPaymentModel paypalPaymentModel =
        PaypalPaymentModel.fromEntity(orderEntity);
    final cartCubit = context.read<CartCubit>();
    final addOrderCubit = context.read<AddOrderCubit>();
    log('${paypalPaymentModel.toJson()}');
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: AppKeys.paypalClientId,
        secretKey: AppKeys.paypalSecretKey,
        transactions: [paypalPaymentModel.toJson()],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          addOrderCubit.addOrder(
              order: orderEntity, localization: localization);
          cartCubit.deleteCartItems();
          customToast(
              message: S.of(context).payment_success,
              state: ToastStates.success);
          backToHomeScreen();
        },
        onError: (error) {
          log("onError: $error");
          context.pop();

          customToast(
              message: S.of(context).payment_error, state: ToastStates.error);
        },
        onCancel: () {
          log('cancelled:');
        },
      ),
    ));
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
