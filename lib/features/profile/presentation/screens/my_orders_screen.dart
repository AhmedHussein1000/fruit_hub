import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/features/profile/presentation/controllers/get_orders_cubit/get_orders_cubit.dart';
import 'package:fruit_hub/features/profile/presentation/screens/widgets/my_orders_body.dart';
import 'package:fruit_hub/generated/l10n.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return BlocProvider(
      create: (context) =>
          GetOrdersCubit(getIt())..getUserOrders(localization: localization),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).my_orders,
          ),
          leading: const CustomLeadingBackButton(),
        ),
        body: const MyOrdersBody(),
      ),
    );
  }
}
