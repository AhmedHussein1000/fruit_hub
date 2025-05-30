import 'package:equatable/equatable.dart';


class UserEntity extends Equatable {
  final String userId;
  final String name;
  final String email;

 const UserEntity({required this.userId, required this.name, required this.email});
 
  @override 
  List<Object?> get props => [userId, name, email];

 
}