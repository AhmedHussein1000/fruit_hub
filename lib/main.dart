import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/routing/app_router.dart';
import 'package:fruit_hub/core/routing/routes.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
           useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter().onGenerateRoute,
        initialRoute: Routes.splash,
        
      ),
    );
  }
}