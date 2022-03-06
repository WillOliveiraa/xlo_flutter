import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_filter_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';

abstract class GetFilteredAdsRepository {
  Future<Either<Failure, List<AdEntity>>> getFilteredAds({
    required AdFilterEntity filter,
    String? search,
    CategoryEntity? category,
    required int page,
  });
}
