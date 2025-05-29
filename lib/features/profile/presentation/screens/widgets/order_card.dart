import 'package:flutter/material.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/features/checkout/domain/entities/success_order_entity.dart';
import 'package:fruit_hub/core/utils/enums.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/generated/l10n.dart';

class OrderCard extends StatelessWidget {
  final SuccessOrderEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha((0.1 * 255).toInt()),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).order_id(order.orderID.substring(0, 8)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.font14Bold.copyWith(color: Colors.black45),
                ),
                _buildStatusContainer(context: context, status: order.status),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              S.of(context).order_items_count(
                    order.orderProducts.length,
                    order.orderProducts.length > 1
                        ? S.of(context).items
                        : S.of(context).item,
                  ),
              style: Styles.font16SemiBold.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    size: 16, color: AppColors.mediumNeutralGray),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '${order.shippingAddress.address}, ${order.shippingAddress.city}',
                    style: Styles.font16SemiBold
                        .copyWith(color: AppColors.mediumNeutralGray),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).total,
                  style: Styles.font16SemiBold.copyWith(color: Colors.black),
                ),
                Text(
                  S.of(context).numberOfPounds(order.totalPrice),
                  style: Styles.font14Bold
                      .copyWith(color: AppColors.darkGreenPrimaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusContainer(
      {required OrderStatusEnum status, required BuildContext context}) {
    Color chipColor;
    String statusText;
    switch (status) {
      case OrderStatusEnum.pending:
        chipColor = Colors.orange;
        statusText = S.of(context).order_status_pending;
        break;
      case OrderStatusEnum.accepted:
        chipColor = Colors.blue;
        statusText = S.of(context).order_status_accepted;
        break;
      case OrderStatusEnum.delivered:
        chipColor = Colors.green;
        statusText = S.of(context).order_status_delivered;
        break;
      case OrderStatusEnum.cancelled:
        chipColor = Colors.red;
        statusText = S.of(context).order_status_cancelled;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        statusText,
        style: Styles.font12SemiBold.copyWith(color: Colors.white),
      ),
    );
  }
}
