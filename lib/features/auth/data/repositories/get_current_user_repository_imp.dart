import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/data/datasources/get_current_user_datasource.dart';
import 'package:xlo_flutter/features/auth/domain/entities/user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_get_current_user.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/get_current_user_repository.dart';

class GetCurrentUserRepositoryImp implements GetCurrentUserRepository {
  GetCurrentUserRepositoryImp(this._datasource);

  final GetCurrentUserDatasource _datasource;

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      return await _datasource.getCurrentUser();
    } catch (e) {
      return Left(ErrorGetCurrentUser());
    }
  }
}
