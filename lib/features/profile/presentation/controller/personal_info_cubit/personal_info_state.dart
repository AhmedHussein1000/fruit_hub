part of 'personal_info_cubit.dart';

abstract class PersonalInfoState extends Equatable {
  const PersonalInfoState();

  @override
  List<Object> get props => [];
}

class PersonalInfoInitial extends PersonalInfoState {}

class PersonalInfoLoading extends PersonalInfoState {}

class PersonalInfoSuccess extends PersonalInfoState {
  final UserEntity userEntity;

 const PersonalInfoSuccess({required this.userEntity});
}

class PersonalInfoError extends PersonalInfoState {
  final String message;

  const PersonalInfoError({required this.message});

  @override
  List<Object> get props => [message];
}
