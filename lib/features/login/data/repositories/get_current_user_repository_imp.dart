import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/login/data/datasources/get_current_user_datasource.dart';
import 'package:xlo_flutter/features/login/domain/entities/user_entity.dart';
import 'package:xlo_flutter/features/login/domain/errors/error_get_current_user.dart';
import 'package:xlo_flutter/features/login/domain/repositories/get_current_user_repository.dart';

class GetCurrentUserRepositoryImp implements GetCurrentUserRepository {
  final GetCurrentUserDatasource _datasource;

  GetCurrentUserRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      return await _datasource.getCurrentUser();
    } catch (e) {
      return Left(ErrorGetCurrentUser());
    }
  }
}
