import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/logout_user_repository.dart';

abstract class LogoutUserUseCase {
  Future<Either<Failure, Unit>> call();
}

class LogoutUserUseCaseImp implements LogoutUserUseCase {
  LogoutUserUseCaseImp(this._repository);

  final LogoutUserRepository _repository;

  @override
  Future<Either<Failure, Unit>> call() async {
    final result = await _repository.logoutUser();
    return result;
  }
}
