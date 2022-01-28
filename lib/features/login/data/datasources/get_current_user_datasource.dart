import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/login/data/models/user_model.dart';

abstract class GetCurrentUserDatasource {
  Future<Either<Failure, UserModel>> getCurrentUser();
}
