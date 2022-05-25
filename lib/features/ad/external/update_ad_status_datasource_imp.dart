import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/core/shared/utils/table_keys.dart';
import 'package:xlo_flutter/features/ad/data/datasources/update_ad_status_datasource.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_update_ad_status.dart';

class UpdateAdStatusDatasourceImp implements UpdateAdStatusDatasource {
  @override
  Future<Either<Failure, Unit>> updateAdStatus(
      {required String adId, required AdStatus adStatus}) async {
    final parseObject = ParseObject(keyAdTable)..set(keyAdId, adId);

    parseObject.set(keyAdStatus, adStatus.index);

    final response = await parseObject.save();
    if (response.success) {
      return const Right(unit);
    } else {
      return Left(
          ErrorUpdateAdStatus(message: 'Erro ao tentar atualizar o anúncio'));
    }
  }
}
