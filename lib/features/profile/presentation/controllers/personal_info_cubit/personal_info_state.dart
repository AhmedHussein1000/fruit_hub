part of 'personal_info_cubit.dart';

sealed class PersonalInfoState extends Equatable {
  const PersonalInfoState();

  @override
  List<Object> get props => [];
}

final class PersonalInfoInitial extends PersonalInfoState {}

// Profile update states
final class ProfileUpdateLoading extends PersonalInfoState {}

final class ProfileUpdateSuccess extends PersonalInfoState {
  final UserEntity userEntity;

  const ProfileUpdateSuccess({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}

final class ProfileUpdateError extends PersonalInfoState {
  final String message;

  const ProfileUpdateError({required this.message});

  @override
  List<Object> get props => [message];
}

// Password change states
final class PasswordChangeLoading extends PersonalInfoState {}

final class PasswordChangeSuccess extends PersonalInfoState {}

final class PasswordChangeError extends PersonalInfoState {
  final String message;

  const PasswordChangeError({required this.message});

  @override
  List<Object> get props => [message];
}
