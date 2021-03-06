import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/sign_in_with_email_repository.dart';

abstract class SignInWithEmailUseCase {
  Future<Either<Failure, UserEntity>> call(String email, String password);
}

class SignInWithEmailUseCaseImp implements SignInWithEmailUseCase {
  SignInWithEmailUseCaseImp(this._repository);

  final SignInWithEmailRepository _repository;

  @override
  Future<Either<Failure, UserEntity>> call(
      String email, String password) async {
    final result =
        await _repository.signInWithEmail(email: email, password: password);
    return result;
  }
}
