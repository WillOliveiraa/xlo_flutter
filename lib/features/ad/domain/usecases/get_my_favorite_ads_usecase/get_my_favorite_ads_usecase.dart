import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_my_favorite_ads_repository.dart';

abstract class GetMyFavoriteAds {
  Future<Either<Failure, List<AdEntity>>> call(String userId);
}

class GetMyFavoriteAdsUseCaseImp implements GetMyFavoriteAds {
  GetMyFavoriteAdsUseCaseImp(this._repository);

  final GetMyFavoriteAdsRepository _repository;

  @override
  Future<Either<Failure, List<AdEntity>>> call(String userId) async {
    final result = await _repository.getMyFavoriteAds(userId);
    return result;
  }
}
