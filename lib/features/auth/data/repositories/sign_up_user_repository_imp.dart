import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/data/datasources/sign_up_user_datasource.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_sign_up_user.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/sign_up_user_repository.dart';

class SignUpUserRepositoryImp implements SignUpUserRepository {
  final SignUpUserDatasource _datasource;

  SignUpUserRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, UserModel>> signUpUser(
      SignUpUserEntity signUpUserEntity) async {
    try {
      return await _datasource.signUpUser(signUpUserEntity);
    } catch (e) {
      return Left(ErrorSignUpUser());
    }
  }
}
