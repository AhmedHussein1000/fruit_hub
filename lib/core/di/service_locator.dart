import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/login/data/repository/login_repos_impl.dart';
import 'package:fruit_hub/features/login/domain/repository/base_login_repo.dart';
import 'package:fruit_hub/features/login/presentation/controller/login_cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  //cubits
  getIt.registerFactory(
    () => LoginCubit(getIt()),
  );
  //repos
  getIt.registerLazySingleton<BaseLoginRepo>(
    () => LoginReposImpl(getIt()),
  );
  //services
  getIt.registerLazySingleton(
    () => FirebaseAuthService(),
  );
}
