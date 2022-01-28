import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/login/domain/entities/user_entity.dart';

abstract class GetCurrentUserRepository {
  Future<Either<Failure, UserEntity>> getCurrentUser();
}
