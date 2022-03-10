import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/data/datasources/save_user_datasource.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';
import 'package:xlo_flutter/features/auth/domain/errors/error_save_user.dart';
import 'package:xlo_flutter/features/auth/domain/repositories/save_user_repository.dart';

class SaveUserRepositoryImp implements SaveUserRepository {
  final SaveUserDatasource _datasource;

  SaveUserRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, Unit>> saveUser(SignUpUserEntity userEntity) async {
    try {
      return await _datasource.saveUser(userEntity);
    } catch (e) {
      return Left(ErrorSaveUser());
    }
  }
}
