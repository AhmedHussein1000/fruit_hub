import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/generated/l10n.dart';

abstract class BaseLoginRepo{
  Future<Either<Failure,User>> loginWithEmailAndPassword({required String email,required String password,required S localization});
  Future<Either<Failure,User>> signInWithGoogle({required S localization});
}