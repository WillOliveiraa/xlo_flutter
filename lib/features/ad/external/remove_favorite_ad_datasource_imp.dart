import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/data/datasources/remove_favorite_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_remove_favorite_ad.dart';

class RemoveFavoriteAdDatasourceImp implements RemoveFavoriteAdDatasource {
  @override
  Future<Either<Failure, Unit>> removeFavoriteAd(
      {required String adId, required String userId}) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable));

    queryBuilder.whereEqualTo(keyFavoritesOwner, userId);
    queryBuilder.whereEqualTo(
        keyFavoritesAd, ParseObject(keyAdTable)..set(keyAdId, adId));

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      for (final f in response.results as List<ParseObject>) await f.delete();

      return Right(unit);
    } else
      return Left(ErrorRemoveFavoriteAd(
          message: 'Erro ao tentar remover o anúncio dos favoritos'));
  }
}
