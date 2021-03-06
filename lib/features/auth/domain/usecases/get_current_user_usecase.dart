import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/get_current_user_repository.dart';

abstract class GetCurrentUser {
  Future<Either<Failure, UserEntity>> call();
}

class GetCurrentUserImp implements GetCurrentUser {
  GetCurrentUserImp(this._repository);

  final GetCurrentUserRepository _repository;

  @override
  Future<Either<Failure, UserEntity>> call() async {
    final result = await _repository.getCurrentUser();
    return result;
  }
}
