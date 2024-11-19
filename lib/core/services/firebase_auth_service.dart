import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/generated/l10n.dart';

class FirebaseAuthService {
  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
    required S localization, 
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.loginUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: localization.userNotFound);
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: localization.wrongPassword);
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: localization.invalidEmail);
      } else if (e.code == 'user-disabled') {
        throw CustomException(message: localization.userDisabled);
      } else if (e.code == 'operation-not-allowed') {
        throw CustomException(message: localization.operationNotAllowed);
      } else if (e.code == 'too-many-requests') {
        throw CustomException(message: localization.tooManyRequests);
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: localization.invalidCredential);
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: localization.networkRequestFailed);
      } else {
        throw CustomException(message: localization.unexpectedError);
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.loginUserWithEmailAndPassword: ${e.toString()}");
      throw CustomException(message: localization.unexpectedError);
    }
  }
}
