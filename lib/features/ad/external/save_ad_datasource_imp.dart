import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/features/ad/data/datasources/save_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_save_ad.dart';

class SaveAdDatasourceImp implements SaveAdDatasource {
  @override
  Future<Either<Failure, Unit>> saveAd(AdEntity adEntity) async {
    final _parseObject = ParseObject('Ad');
    final ad = _parseObject
      ..set<String>('Title', adEntity.title)
      ..set<String>('Description', adEntity.description);

    final result = await ad.save();

    if (result.success)
      return Right(unit);
    else
      return Left(ErrorSaveAd());
  }
}
