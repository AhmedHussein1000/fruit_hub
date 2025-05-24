
  import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:fruit_hub/core/functions/user_functions/add_user_data.dart';
import 'package:fruit_hub/core/functions/user_functions/cache_user_data.dart';
import 'package:fruit_hub/core/functions/user_functions/get_user_from_server.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';

Future<void> isUserDataExist(UserEntity userEntity) async {
    bool isDataExist = await getIt<DatabaseService>().checkIfDataExist(
        path: BackendEndpoints.isUserExist, docId: userEntity.userId);
    if (isDataExist) {
      await getUserDataFromServer(uid: userEntity.userId);
      await cacheUserData(userEntity);
    } else {
      await addUserData(userEntity: userEntity);
    }
  }