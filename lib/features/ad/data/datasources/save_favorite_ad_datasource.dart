import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';

abstract class SaveFavoriteAdDatasource {
  Future<Either<Failure, Unit>> saveFavoriteAd(List<String> adIds);
}
