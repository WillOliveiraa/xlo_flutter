import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/login/domain/repositories/sign_in_with_email_repository.dart';

abstract class SignInWithEmailUseCase {
  Future<Either<Failure, Unit>> call(String email, String password);
}

class SignInWithEmailUseCaseImp implements SignInWithEmailUseCase {
  final SignInWithEmailRepository _repository;

  SignInWithEmailUseCaseImp(this._repository);

  @override
  Future<Either<Failure, Unit>> call(String email, String password) async {
    return await _repository.signInWithEmail(email: email, password: password);
  }
}
