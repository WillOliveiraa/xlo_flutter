import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/login/data/datasources/sign_in_with_email_datasource.dart';
import 'package:xlo_flutter/features/login/domain/errors/error_sign_in_with_email.dart';
import 'package:xlo_flutter/features/login/domain/repositories/sign_in_with_email_repository.dart';

class SignInWithEmailRepositoryImp implements SignInWithEmailRepository {
  final SignInWithEmailDatasource _datasource;

  SignInWithEmailRepositoryImp(this._datasource);
  @override
  Future<Either<Failure, Unit>> signInWithEmail(
      {required String email, required String password}) async {
    try {
      return await _datasource.signInWithEmail(
          email: email, password: password);
    } catch (e) {
      return Left(ErrorSignInWithEmail());
    }
  }
}
