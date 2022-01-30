import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';

abstract class SignUpUserRepository {
  Future<Either<Failure, UserEntity>> signUpUser(UserEntity userEntity);
}
