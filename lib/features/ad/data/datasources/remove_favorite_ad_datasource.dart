import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';

abstract class RemoveFavoriteAdDatasource {
  Future<Either<Failure, Unit>> removeFavoriteAd(
      {required String adId, required String userId});
}
