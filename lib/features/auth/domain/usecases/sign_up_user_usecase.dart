import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/sign_up_user_repository.dart';

abstract class SignUpUserUseCase {
  Future<Either<Failure, UserEntity>> call(SignUpUserEntity signUpUserEntity);
}

class SignUpUserUseCaseImp implements SignUpUserUseCase {
  final SignUpUserRepository _repository;

  SignUpUserUseCaseImp(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(
      SignUpUserEntity signUpUserEntity) async {
    return await _repository.signUpUser(signUpUserEntity);
  }
}
