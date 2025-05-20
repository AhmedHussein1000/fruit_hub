import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/generated/l10n.dart';

abstract class AuthService {
  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
    required S localization,
  });
  Future<User> signInWithGoogle({required S localization});
  Future<User> signInWithFacebook({required S localization});
  Future<User> signupWithEmailAndPassword(
      {required String email,
      required String password,
      required S localization});
  Future<void> deleteUser(User? user);
  bool isLoggedIn();
  Future<void> signOut();

  Future<void> updateUserProfile({required String displayName});
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required S localization,
  });
}
