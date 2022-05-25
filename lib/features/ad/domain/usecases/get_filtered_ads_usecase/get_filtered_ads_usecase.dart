import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_filter_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';
import 'package:xlo_flutter/features/ad/domain/repositories/get_filtered_ads_repository.dart';

abstract class GetFilteredAdsUseCase {
  Future<Either<Failure, List<AdEntity>?>> call({
    required AdFilterEntity filter,
    String? search,
    CategoryEntity? category,
    required int page,
  });
}

class GetFilteredAdsUseCaseImp implements GetFilteredAdsUseCase {
  GetFilteredAdsUseCaseImp(this._repository);

  final GetFilteredAdsRepository _repository;

  @override
  Future<Either<Failure, List<AdEntity>?>> call(
      {required AdFilterEntity filter,
      String? search,
      CategoryEntity? category,
      required int page}) async {
    final result = await _repository.getFilteredAds(
      filter: filter,
      search: search,
      category: category,
      page: page,
    );
    return result;
  }
}
