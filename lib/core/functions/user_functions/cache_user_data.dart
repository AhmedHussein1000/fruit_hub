import 'dart:convert';

import 'package:fruit_hub/core/helpers/cache_helper.dart';
import 'package:fruit_hub/features/signup/data/models/user_model.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';

Future cacheUserData(UserEntity userEntity) async {
    var jsonData = jsonEncode(UserModel.fromUserEntity(userEntity).toJson());

    await CacheHelper.saveData(key: CacheHelper.userDataKey, value: jsonData);
  }