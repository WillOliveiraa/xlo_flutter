import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_ads.dart';

class GetAllAdsDatasourceImp implements GetAllAdsDatasource {
  @override
  Future<Either<Failure, List<AdModel>?>> getAllAds() async {
    final QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyAdTable));

    queryBuilder.includeObject([keyAdOwner, keyAdCategory]);

    // queryBuilder.setAmountToSkip(page * 5);
    // queryBuilder.setLimit(5);
    queryBuilder.whereEqualTo(keyAdStatus, AdStatus.active.index);
    queryBuilder.orderByDescending(keyAdCreatedAt);

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
        ErrorGetAllAds(
          message: 'Ocorreu um erro ao tentar obter os anúncios',
        ),
      );
    }
  }
}
