import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';

abstract class LogoutUserRepository {
  Future<Either<Failure, Unit>> logoutUser();
}
