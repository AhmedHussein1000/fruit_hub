import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exceptions.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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

  Future<User> signInWithGoogle({required S localization}) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw CustomException(message: localization.noGoogleAccountSelected);
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook({required S localization}) async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status != LoginStatus.success) {
      log("Exception in FirebaseAuthService.signInWithFacebook: ${loginResult.message}");
      throw CustomException(message: localization.noFacebookAccountSelected);
    }
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  Future<User> signupWithEmailAndPassword(
      {required String email,
      required String password,
      required S localization}) async {
      try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  return credential.user!;
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    throw CustomException(message: localization.weakPassword );
  } else if (e.code == 'email-already-in-use') {
    throw CustomException(message: localization.emailAlreadyInUse);
  } else if (e.code == 'invalid-email') {
    throw CustomException(message: localization.invalidEmail);
  } else if (e.code == 'network-request-failed') {
    throw CustomException(message: localization.networkRequestFailed);
  } else if (e.code == 'operation-not-allowed') {
    throw CustomException(message: localization.operationNotAllowed);
  } else {
    log("Exception in FirebaseAuthService.signupWithEmailAndPassword: ${e.toString()}");
    throw CustomException(message:  localization.unexpectedError);
  }
} catch (e) {
  log("Exception in FirebaseAuthService.signupWithEmailAndPassword: ${e.toString()}");
  throw CustomException(message: localization.unexpectedError );
}
  
      }
  Future<void> deleteUser(User? user)async{
    if(user!=null){
await FirebaseAuth.instance.currentUser!.delete();
    }
    
  }    
}
