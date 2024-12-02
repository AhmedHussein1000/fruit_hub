import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  @JsonKey(name: 'user_id')
  final String uId;
  const UserModel(
      {required this.uId, required super.name, required super.email})
      : super(userId: uId);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  factory UserModel.fromUserEntity(UserEntity userEntity) {
    return UserModel(
        uId: userEntity.userId, name: userEntity.name, email: userEntity.email);
  }
  factory UserModel.fromFirebaseUser(User user){
    return UserModel(uId: user.uid, name: user.displayName!, email: user.email!);
  }
}
