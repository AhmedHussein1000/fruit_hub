import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:fruit_hub/core/widgets/notification_widget.dart';
import 'package:fruit_hub/features/products/presentation/screens/widgets/products_screen_body.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).products,
          ),
          actions:  [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const NotificationWidget(),
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) => ProductsCubit(getIt())..getProducts(),
          child: const ProductsScreenBody(),
        ));
  }
}
