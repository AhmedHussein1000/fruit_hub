import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/functions/user_functions/get_cached_user.dart';
import 'package:fruit_hub/features/profile/domain/repository/base_profile_repo.dart';
import 'package:fruit_hub/features/signup/domain/entities/user_entity.dart';
import 'package:fruit_hub/generated/l10n.dart';

part 'personal_info_state.dart';

class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  final BaseProfileRepo _baseProfileRepo;

  PersonalInfoCubit(this._baseProfileRepo) : super(PersonalInfoInitial());

  Future<void> updateUserProfile({
    required String name,
    required S localization,
  }) async {
    emit(ProfileUpdateLoading());
    final updateProfileResult = await _baseProfileRepo.updateUserProfile(
      displayName: name,
      localization: localization,
    );

    updateProfileResult.fold(
        (failure) => emit(ProfileUpdateError(message: failure.message)), (user) {
      final cachedUser = getCachedUser();
      if (cachedUser != null) {
        emit(ProfileUpdateSuccess(userEntity: cachedUser));
      }
    });
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
    required S localization,
  }) async {
    if (newPassword != confirmPassword) {
      emit(PasswordChangeError(message: localization.passwordsDoNotMatch));
      return;
    }

    emit(PasswordChangeLoading());
    final changePasswordResult = await _baseProfileRepo.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      localization: localization,
    );

    changePasswordResult.fold(
        (failure) => emit(PasswordChangeError(message: failure.message)), (_) {
        emit( PasswordChangeSuccess());
    
    });}
  }

