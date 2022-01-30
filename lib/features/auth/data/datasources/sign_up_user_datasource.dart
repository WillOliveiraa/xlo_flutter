import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/auth/data/models/user_model.dart';
import 'package:xlo_flutter/features/auth/domain/entities/sign_up_user_entity.dart';

abstract class SignUpUserDatasource {
  Future<Either<Failure, UserModel>> signUpUser(
      SignUpUserEntity signUpUserEntity);
}
