import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/remove_favorite_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_remove_favorite_ad.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/remove_favorite_ad_repository.dart';

class RemoveFavoriteAdRepositoryImp implements RemoveFavoriteAdRepository {
  final RemoveFavoriteAdDatasource _datasource;

  RemoveFavoriteAdRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, Unit>> removeFavoriteAd(
      {required String adId, required String userId}) async {
    try {
      return await _datasource.removeFavoriteAd(adId: adId, userId: userId);
    } catch (e) {
      return Left(ErrorRemoveFavoriteAd());
    }
  }
}
