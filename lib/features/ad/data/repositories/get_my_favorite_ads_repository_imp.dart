import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_my_favorite_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_my_favorite_ads.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_my_favorite_ads_repository.dart';

class GetMyFavoriteAdsRepositoryImp implements GetMyFavoriteAdsRepository {
  final GetMyFavoriteAdsDatasource _datasource;

  GetMyFavoriteAdsRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, List<AdModel>>> getMyFavoriteAds(String userId) async {
    try {
      return await _datasource.getMyFavoriteAds(userId);
    } catch (e) {
      return Left(ErrorGetMyFavoriteAds());
    }
  }
}
