import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/cubits/language_cubit/language_cubit.dart';
import 'package:fruit_hub/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:fruit_hub/core/functions/initialize_app.dart';
import 'package:fruit_hub/core/routes/app_router.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/themes/dark_theme.dart';
import 'package:fruit_hub/core/themes/light_theme.dart';
import 'package:fruit_hub/features/cart/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/favorites/presentation/controllers/favorites_cubit/favorites_cubit.dart';
import 'package:fruit_hub/generated/l10n.dart';

void main() async {
  await initializeApp();
  runApp(MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => LanguageCubit()),
          BlocProvider(create: (context) => FavoritesCubit()),
          BlocProvider(
            create: (context) => CartCubit()..getCachedCartItems(),
          ),
        ],
        child: const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: context.watch<LanguageCubit>().state,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: context.watch<ThemeCubit>().state,
        onGenerateRoute: AppRouter().onGenerateRoute,
        initialRoute: Routes.splash,
      ),
    );
  }
}
