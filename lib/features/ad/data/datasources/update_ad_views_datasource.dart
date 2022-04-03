import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';

abstract class UpdateAdViewsDatasource {
  Future<Either<Failure, Unit>> updateAdViews(
      {required String adId, required int views});
}
