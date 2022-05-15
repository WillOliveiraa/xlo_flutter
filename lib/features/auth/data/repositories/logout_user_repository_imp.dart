import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/data/datasources/logout_user_datasource.dart';
import 'package:xlo_flutter/features/auth/domain/errors/logout_save_user.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/logout_user_repository.dart';

class LogoutUserRepositoryImp implements LogoutUserRepository {
  final LogoutUserDatasource _datasource;

  LogoutUserRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, Unit>> logoutUser() async {
    try {
      return await _datasource.logoutUser();
    } catch (e) {
      return Left(ErrorLogoutUser());
    }
  }
}
