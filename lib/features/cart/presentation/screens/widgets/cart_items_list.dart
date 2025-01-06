import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/cart/presentation/screens/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        separatorBuilder: (context, index) => const CustomDivider(),
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.5.w),
              child: const CartItem(),
            ),
        itemCount: 10);
  }
}
