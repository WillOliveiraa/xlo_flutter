import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_my_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_my_ads.dart';

class GetMyAdsDatasourceImp implements GetMyAdsDatasource {
  @override
  Future<Either<Failure, List<AdModel>>> getMyAds() async {
    final currentUser = await ParseUser.currentUser();
    final QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyAdTable));

    queryBuilder.setLimit(100);
    queryBuilder.orderByDescending(keyAdCreatedAt);
    queryBuilder.whereEqualTo(
        keyAdOwner, (currentUser as ParseUser).toPointer());
    queryBuilder.includeObject([keyAdOwner, keyAdCategory]);

    final ParseResponse response = await queryBuilder.query();

    final List<AdModel> adsList = [];
    if (response.success) {
      for (final ParseObject object in response.result) {
        final AdModel obj = AdModel.fromParse(object);
        adsList.add(obj);
      }
      return Right(adsList);
    } else {
      return Left(
        ErrorGetMyAds(
          message: 'Ocorreu um erro ao tentar obter os meus anúncios',
        ),
      );
    }
  }
}
