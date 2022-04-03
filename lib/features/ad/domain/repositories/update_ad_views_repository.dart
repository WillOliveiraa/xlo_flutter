import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';

abstract class UpdateAdViewsRepository {
  Future<Either<Failure, Unit>> updateAdViews(
      {required String adId, required int views});
}
