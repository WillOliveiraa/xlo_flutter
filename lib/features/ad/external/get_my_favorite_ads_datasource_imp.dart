import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_my_favorite_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_my_ads.dart';

class GetMyFavoriteAdsDatasourceImp implements GetMyFavoriteAdsDatasource {
  @override
  Future<Either<Failure, List<AdModel>>> getMyFavoriteAds(String userId) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable));

    queryBuilder.whereEqualTo(keyFavoritesOwner, userId);
    queryBuilder.includeObject([keyAdTable, 'ad.owner']);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return Right(response.results!
          .map((parseObj) =>
              AdModel.fromParse(parseObj.get(keyFavoritesAd) as ParseObject))
          .toList());
    } else if (response.success && response.results == null) {
      return const Right([]);
    } else {
      return Left(ErrorGetMyAds(
          message: 'Ocorreu um erro ao tentar obter os meus anúncios'));
    }
  }
}
