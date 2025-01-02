import 'dart:convert';

import 'package:fruit_hub/core/helpers/cache_helper.dart';
import 'package:fruit_hub/features/signup/data/models/user_model.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';

UserEntity? getUser() {
  var jsonString = CacheHelper.getStringData(CacheHelper.userDataKey);
  if(jsonString.isEmpty||jsonString==''){
    return null;
  }
  UserEntity userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
