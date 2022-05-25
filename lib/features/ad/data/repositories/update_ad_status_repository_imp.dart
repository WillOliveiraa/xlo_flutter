import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/update_ad_status_datasource.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_update_ad_status.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/update_ad_status_repository.dart';

class UpdateAdStatusRepositoryImp implements UpdateAdStatusRepository {
  UpdateAdStatusRepositoryImp(this._datasource);

  final UpdateAdStatusDatasource _datasource;

  @override
  Future<Either<Failure, Unit>> updateAdStatus(
      {required String adId, required AdStatus adStatus}) async {
    try {
      return await _datasource.updateAdStatus(adId: adId, adStatus: adStatus);
    } catch (e) {
      return Left(ErrorUpdateAdStatus());
    }
  }
}
