import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/data/datasources/save_favorite_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_save_favorite_ad.dart';

class SaveFavoriteAdDatasourceImp implements SaveFavoriteAdDatasource {
  @override
  Future<Either<Failure, Unit>> saveFavoriteAd(
      {required String adId, required String userId}) async {
    final favoritesObject = ParseObject(keyFavoritesTable);

    favoritesObject.set<String>(keyFavoritesOwner, userId);
    favoritesObject.set<ParseObject>(
      keyFavoritesAd,
      ParseObject(keyAdTable)..set(keyAdId, adId),
    );

    final result = await favoritesObject.save();

    if (result.success) {
      return const Right(unit);
    } else {
      return Left(ErrorSaveFavoriteAd(
          message: 'Erro ao tentar salvar o anúncio nos favoritos'));
    }
  }
}
