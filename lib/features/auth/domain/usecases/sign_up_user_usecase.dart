import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/sign_up_user_repository.dart';

abstract class SignUpUserUseCase {
  Future<Either<Failure, UserEntity>> call(SignUpUserEntity signUpUserEntity);
}

class SignUpUserUseCaseImp implements SignUpUserUseCase {
  SignUpUserUseCaseImp(this._repository);

  final SignUpUserRepository _repository;

  @override
  Future<Either<Failure, UserEntity>> call(
      SignUpUserEntity signUpUserEntity) async {
    final result = await _repository.signUpUser(signUpUserEntity);
    return result;
  }
}
