import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/data/datasources/sign_in_with_email_datasource.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_sign_in_with_email.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/sign_in_with_email_repository.dart';

class SignInWithEmailRepositoryImp implements SignInWithEmailRepository {
  SignInWithEmailRepositoryImp(this._datasource);

  final SignInWithEmailDatasource _datasource;

  @override
  Future<Either<Failure, UserModel>> signInWithEmail(
      {required String email, required String password}) async {
    try {
      return await _datasource.signInWithEmail(
          email: email, password: password);
    } catch (e) {
      return Left(ErrorSignInWithEmail());
    }
  }
}
