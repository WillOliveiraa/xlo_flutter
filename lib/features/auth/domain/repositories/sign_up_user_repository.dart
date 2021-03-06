import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';

abstract class SignUpUserRepository {
  Future<Either<Failure, UserEntity>> signUpUser(
      SignUpUserEntity signUpUserEntity);
}
