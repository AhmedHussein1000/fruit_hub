 import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';
import 'package:fruit_hub/features/signup/data/models/user_model.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';

Future<UserEntity> getUserDataFromServer({required String uid}) async {
    var userData = await getIt<DatabaseService>().getData(
        path: BackendEndpoints.getUserData, docId: uid);
    UserEntity userEntity = UserModel.fromJson(userData);

    return userEntity;
  }