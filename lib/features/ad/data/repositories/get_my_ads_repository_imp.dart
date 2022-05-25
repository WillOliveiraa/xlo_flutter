import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_my_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_my_ads.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_my_ads_repository.dart';

class GetMyAdsRepositoryImp implements GetMyAdsRepository {
  GetMyAdsRepositoryImp(this._datasource);

  final GetMyAdsDatasource _datasource;

  @override
  Future<Either<Failure, List<AdModel>>> getMyAds() async {
    try {
      return await _datasource.getMyAds();
    } catch (e) {
      return Left(ErrorGetMyAds());
    }
  }
}
