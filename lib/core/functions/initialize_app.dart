import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'package:fruit_hub/custom_bloc_observer.dart';
import 'package:fruit_hub/core/helpers/cache_helper.dart';
import 'package:fruit_hub/core/helpers/hive_helper.dart';
import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp();
  await HiveHelper.initializeHive();
  setupServiceLocator();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  Bloc.observer = CustomBlocObserver();

  Intl.defaultLocale = 'ar';
  isSkippedOnBoarding = CacheHelper.getData(CacheHelper.onBoardingKey) ?? false;
}
