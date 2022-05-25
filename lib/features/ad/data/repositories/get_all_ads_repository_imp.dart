import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_all_ads.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_ads_repository.dart';

class GetAllAdsRepositoryImp implements GetAllAdsRepository {
  GetAllAdsRepositoryImp(this._datasource);

  final GetAllAdsDatasource _datasource;

  @override
  Future<Either<Failure, List<AdModel>?>> getAllAds() async {
    try {
      return await _datasource.getAllAds();
    } catch (e) {
      return Left(ErrorGetAllAds());
    }
  }
}
