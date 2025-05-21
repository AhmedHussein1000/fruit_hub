import 'package:fruit_hub/core/repos/orders_repo/base_orders_repo.dart';
import 'package:fruit_hub/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:fruit_hub/core/repos/products_repo/base_products_repo.dart';
import 'package:fruit_hub/core/repos/products_repo/products_repo_impl.dart';
import 'package:fruit_hub/core/services/auth_service.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/firebase_firestore_service.dart';
import 'package:fruit_hub/features/login/data/repository/login_repos_impl.dart';
import 'package:fruit_hub/features/login/domain/repository/base_login_repo.dart';
import 'package:fruit_hub/features/profile/data/repository/profile_repo_impl.dart';
import 'package:fruit_hub/features/profile/domain/repository/base_profile_repo.dart';
import 'package:fruit_hub/features/search/domain/repository/base_search_repo.dart';
import 'package:fruit_hub/features/search/data/repository/search_repo_impl.dart';
import 'package:fruit_hub/features/signup/data/repository/signup_repo_impl.dart';
import 'package:fruit_hub/features/signup/domain/repository/base_signup_repo.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  //repos
  getIt.registerLazySingleton<BaseLoginRepo>(() => LoginReposImpl(
        getIt(),
      ));
  getIt.registerLazySingleton<BaseSignupRepo>(
    () => SignupRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<BaseProductsRepo>(
    () => ProductsRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<BaseOrdersRepo>(
    () => OrdersRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<BaseProfileRepo>(
    () => ProfileRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<BaseSearchRepo>(
    () => SearchRepoImpl(getIt()),
  );
  //services
  getIt.registerLazySingleton<AuthService>(
    () => FirebaseAuthService(),
  );
  getIt.registerLazySingleton<DatabaseService>(
    () => FirestoreService(),
  );
}
