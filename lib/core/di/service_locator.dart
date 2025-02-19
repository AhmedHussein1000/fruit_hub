import 'package:fruit_hub/core/repos/orders_repo/base_orders_repo.dart';
import 'package:fruit_hub/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:fruit_hub/core/repos/products_repo/base_products_repo.dart';
import 'package:fruit_hub/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/firebase_firestore_service.dart';
import 'package:fruit_hub/features/login/data/repository/login_repos_impl.dart';
import 'package:fruit_hub/features/login/domain/repository/base_login_repo.dart';
import 'package:fruit_hub/features/login/presentation/controller/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/signup/data/repository/signup_repo_impl.dart';
import 'package:fruit_hub/features/signup/domain/repository/base_signup_repo.dart';
import 'package:fruit_hub/features/signup/presentation/controller/signup_cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  //cubits
  getIt.registerFactory(
    () => LoginCubit(getIt()),
  );
  getIt.registerFactory(
    () => SignupCubit(getIt()),
  );
  //repos
  getIt.registerLazySingleton<BaseLoginRepo>(
    () => LoginReposImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<BaseSignupRepo>(
    () => SignupRepoImpl(getIt(), getIt()),
  );
  getIt.registerLazySingleton<BaseProductsRepo>(
    () => ProductsRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<BaseOrdersRepo>(
    () => OrdersRepoImpl(getIt()),
  );
  //services
  getIt.registerLazySingleton(
    () => FirebaseAuthService(),
  );
  getIt.registerLazySingleton(
    () => FirestoreService(),
  );
  getIt.registerLazySingleton<DatabaseService>(
    () => FirestoreService(),
  );
}
