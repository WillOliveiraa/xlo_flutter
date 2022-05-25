import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/save_user_repository.dart';

abstract class SaveUserUseCase {
  Future<Either<Failure, Unit>> call(SignUpUserEntity userEntity);
}

class SaveUserUseCaseImp implements SaveUserUseCase {
  SaveUserUseCaseImp(this._repository);

  final SaveUserRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(SignUpUserEntity userEntity) async {
    final result = await _repository.saveUser(userEntity);
    return result;
  }
}
