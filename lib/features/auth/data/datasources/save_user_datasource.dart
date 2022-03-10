import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';

abstract class SaveUserDatasource {
  Future<Either<Failure, Unit>> saveUser(SignUpUserEntity userEntity);
}
