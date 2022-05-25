import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/data/datasources/update_ad_views_datasource.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_update_ad_views.dart';

class UpdateAdViewsDatasourceImp implements UpdateAdViewsDatasource {
  @override
  Future<Either<Failure, Unit>> updateAdViews({
    required String adId,
    required int views,
  }) async {
    final ParseObject parseObject = ParseObject(keyAdTable)..set(keyAdId, adId);

    parseObject.set(keyAdViews, views);

    final ParseResponse response = await parseObject.save();
    if (response.success) {
      return const Right<Failure, Unit>(unit);
    } else {
      return Left<Failure, Unit>(ErrorUpdateAdViews(
          message: 'Erro ao tentar atualizar o número de view do anúncio'));
    }
  }
}
