import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:fruit_hub/features/home/presentation/screens/widgets/home_body.dart';
import 'package:fruit_hub/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => ProductsCubit(getIt())..getBestSellingProducts(localization: localization),
        child: const HomeBody(),
      )),
    );
  }
}
