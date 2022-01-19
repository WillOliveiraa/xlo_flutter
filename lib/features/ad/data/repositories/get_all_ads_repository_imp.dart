import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_all_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_all_ads_repository.dart';

class GetAllAdsRepositoryImp extends GetAllAdsRepository {
  final GetAllAdsDatasource _datasource;

  GetAllAdsRepositoryImp(this._datasource);

  @override
  Future<Either<Failure, List<AdModel>?>> getAllAds() async {
    return await _datasource.getAllAds();
  }
}
