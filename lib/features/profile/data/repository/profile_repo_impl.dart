import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/functions/user_functions/add_user_data.dart';
import 'package:fruit_hub/core/functions/user_functions/cache_user_data.dart';
import 'package:fruit_hub/core/functions/user_functions/get_cached_user.dart';
import 'package:fruit_hub/core/functions/user_functions/get_user_from_server.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/profile/domain/repository/base_profile_repo.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';
import 'package:fruit_hub/generated/l10n.dart';

class ProfileRepoImpl implements BaseProfileRepo {
  final FirebaseAuthService firebaseAuthService;

  ProfileRepoImpl(this.firebaseAuthService);

  @override
  Future<Either<Failure, UserEntity>> updateUserProfile({
    required String displayName,
    required S localization,
  }) async {
    try {
      await firebaseAuthService.updateUserProfile(displayName: displayName);

      UserEntity updatedUser = UserEntity(
        userId: getCachedUser()!.userId,
        name: displayName,
        email: getCachedUser()!.email,
      );
      await addUserData(userEntity: updatedUser);
      UserEntity userEntity = await getUserDataFromServer(uid: updatedUser.userId);
      await cacheUserData(userEntity);
      return Right(updatedUser);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: localization.unexpectedError));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
    required S localization,
  }) async {
    try {
      await firebaseAuthService.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        localization: localization,
      );
      return const Right(null);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: localization.unexpectedError));
    }
  }
}
