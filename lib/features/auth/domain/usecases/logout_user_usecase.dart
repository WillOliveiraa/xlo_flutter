import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/logout_user_repository.dart';

abstract class LogoutUserUseCase {
  Future<Either<Failure, Unit>> call();
}

class LogoutUserUseCaseImp implements LogoutUserUseCase {
  final LogoutUserRepository _repository;

  LogoutUserUseCaseImp(this._repository);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await _repository.logoutUser();
  }
}
