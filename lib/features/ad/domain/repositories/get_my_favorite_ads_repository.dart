import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';

abstract class GetMyFavoriteAdsRepository {
  Future<Either<Failure, List<AdEntity>>> getMyFavoriteAds(String userId);
}
