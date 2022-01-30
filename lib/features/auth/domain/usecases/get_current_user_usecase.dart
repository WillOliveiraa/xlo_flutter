import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/get_current_user_repository.dart';

abstract class GetCurrentUser {
  Future<Either<Failure, UserEntity>> call();
}

class GetCurrentUserImp implements GetCurrentUser {
  final GetCurrentUserRepository _repository;

  GetCurrentUserImp(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call() async {
    return await _repository.getCurrentUser();
  }
}
