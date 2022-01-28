import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/save_ad_datasource.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_save_ad.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/save_ad_repository.dart';

class SaveAdRepositoryImp implements SaveAdRepository {
  final SaveAdDatasource _datasource;

  SaveAdRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, Unit>> saveAd(AdEntity adEntity) async {
    try {
      return await _datasource.saveAd(adEntity);
    } catch (e) {
      return Left(ErrorSaveAd());
    }
  }
}
