import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/datasources/get_filtered_ads_datasource.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_filter_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/ad/domain/errors/error_get_filtered_ads.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_filtered_ads_repository.dart';

class GetFilteredAdsRepositoryImp implements GetFilteredAdsRepository {
  GetFilteredAdsRepositoryImp(this._datasource);

  final GetFilteredAdsDatasource _datasource;

  @override
  Future<Either<Failure, List<AdModel>>> getFilteredAds({
    required AdFilterEntity filter,
    String? search,
    CategoryEntity? category,
    required int page,
  }) async {
    try {
      return await _datasource.getFilteredAds(
        filter: filter,
        search: search,
        category: category,
        page: page,
      );
    } catch (e) {
      return Left(ErrorGetFilteredAds());
    }
  }
}
