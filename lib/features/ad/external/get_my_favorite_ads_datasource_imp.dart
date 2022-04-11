import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_my_favorite_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_my_ads.dart';

class GetMyFavoriteAdsDatasourceImp implements GetMyFavoriteAdsDatasource {
  @override
  Future<Either<Failure, List<AdModel>>> getMyFavoriteAds(String userId) async {
    final currentUser = await ParseUser.currentUser();
    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable));

    queryBuilder.setLimit(100);
    queryBuilder.orderByDescending(keyAdCreatedAt);
    queryBuilder.whereEqualTo(keyAdOwner, currentUser.toPointer());
    queryBuilder.includeObject([keyAdOwner, keyAdCategory]);

    final response = await queryBuilder.query();

    List<AdModel> adsList = [];
    if (response.success) {
      for (final object in response.result) {
        final obj = AdModel.fromParse(object);
        adsList.add(obj);
      }
      return Right(adsList);
    } else
      return Left(ErrorGetMyAds(
          message: 'Ocorreu um erro ao tentar obter os meus anúncios'));
  }
}
