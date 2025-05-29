import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/core/widgets/custom_circle_progress_indicator.dart';
import 'package:fruit_hub/core/widgets/custom_text_message.dart';
import 'package:fruit_hub/features/profile/presentation/controllers/get_orders_cubit/get_orders_cubit.dart';
import 'package:fruit_hub/features/profile/presentation/screens/widgets/order_card.dart';
import 'package:fruit_hub/generated/l10n.dart';

class MyOrdersBody extends StatelessWidget {
  const MyOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit, GetOrdersState>(
      builder: (context, state) {
        if (state is GetOrdersLoading) {
          return const CustomCircleProgressIndicator();
        } else if (state is GetOrdersFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: Styles.font16SemiBold,
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is GetOrdersSuccess) {
          if (state.orders.isEmpty) {
            return CustomTextMessage(
              message: S.of(context).no_orders_yet,
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: state.orders.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              return OrderCard(order: state.orders[index]);
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
