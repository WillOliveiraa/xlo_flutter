import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';

abstract class GetMyFavoriteAdsDatasource {
  Future<Either<Failure, List<AdModel>>> getMyFavoriteAds(String userId);
}
