part of 'personal_info_cubit.dart';

abstract class PersonalInfoState extends Equatable {
  const PersonalInfoState();

  @override
  List<Object> get props => [];
}

class PersonalInfoInitial extends PersonalInfoState {}

class PersonalInfoLoading extends PersonalInfoState {}

class PersonalInfoSuccess extends PersonalInfoState {}

class PersonalInfoError extends PersonalInfoState {
  final String message;

  const PersonalInfoError({required this.message});

  @override
  List<Object> get props => [message];
}
