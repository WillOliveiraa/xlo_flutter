import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/save_favorite_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_save_favorite_ad.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/save_favorite_ad_repository.dart';

class SaveFavoriteAdRepositoryImp implements SaveFavoriteAdRepository {
  final SaveFavoriteAdDatasource _datasource;

  SaveFavoriteAdRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, Unit>> saveFavoriteAd(
      {required String adId, required String userId}) async {
    try {
      return await _datasource.saveFavoriteAd(adId: adId, userId: userId);
    } catch (e) {
      return Left(ErrorSaveFavoriteAd());
    }
  }
}
