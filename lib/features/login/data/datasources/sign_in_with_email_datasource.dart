import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';

abstract class SignInWithEmailDatasource {
  Future<Either<Failure, Unit>> signInWithEmail(
      {required String email, required String password});
}
