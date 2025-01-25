import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/functions/show_toast.dart';
import 'package:fruit_hub/core/utils/app_keys.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
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
                _handleShippingSectionValidation(context);
                _handleAddressInputsValidation();
                if(currentIndex == 2){
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckoutView(
                    sandboxMode: true,
                    clientId:AppKeys.paypalClientId,
                    secretKey: AppKeys.paypalSecretKey,
                    transactions: const [
                      {
                        "amount": {
                          "total": '70',
                          "currency": "USD",
                          "details": {
                            "subtotal": '70',
                            "shipping": '0',
                            "shipping_discount": 0
                          }
                        },
                        "description": "The payment transaction description.",
                      
                        "item_list": {
                          "items": [
                            {
                              "name": "Apple",
                              "quantity": 4,
                              "price": '5',
                              "currency": "USD"
                            },
                            {
                              "name": "Pineapple",
                              "quantity": 5,
                              "price": '10',
                              "currency": "USD"
                            }
                          ],

                         
                        }
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      print("onSuccess: $params");
                    },
                    onError: (error) {
                      print("onError: $error");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      print('cancelled:');
                    },
                  ),
                ));
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

  void _handleShippingSectionValidation(BuildContext context) {
    if (currentIndex == 0) {
      if (context.read<OrderEntity>().payWithCash != null) {
        pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      } else {
        customToast(
            message: S.of(context).select_payment_method,
            state: ToastStates.warning);
      }
    }
  }

  void _handleAddressInputsValidation() {
    if (currentIndex == 1) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      } else {
        valueNotifierAutovalidateMode.value = AutovalidateMode.always;
      }
    }
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
