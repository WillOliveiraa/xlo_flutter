import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';

abstract class SignInWithEmailRepository {
  Future<Either<Failure, Unit>> signInWithEmail(
      {required String email, required String password});
}
