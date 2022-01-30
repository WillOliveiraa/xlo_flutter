import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/sign_up_user_repository.dart';

abstract class SignUpUserUseCase {
  Future<Either<Failure, UserEntity>> call(UserEntity userEntity);
}

class SignUpUserUseCaseImp implements SignUpUserUseCase {
  final SignUpUserRepository _repository;

  SignUpUserUseCaseImp(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity userEntity) async {
    return await _repository.signUpUser(userEntity);
  }
}
