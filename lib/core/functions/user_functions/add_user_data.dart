import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';
import 'package:fruit_hub/features/signup/data/models/user_model.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';

Future<void> addUserData({required UserEntity userEntity}) async {
  UserModel userModel = UserModel.fromUserEntity(userEntity);
  await getIt<DatabaseService>().addData(
      path: BackendEndpoints.addUserData,
      data: userModel.toJson(),
      docId: userEntity.userId);
}
