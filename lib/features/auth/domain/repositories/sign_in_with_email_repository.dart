import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';

abstract class SignInWithEmailRepository {
  Future<Either<Failure, UserEntity>> signInWithEmail(
      {required String email, required String password});
}
