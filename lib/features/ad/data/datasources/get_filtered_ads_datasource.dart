import 'package:dartz/dartz.dart';
import 'package:xlo_flutter/core/errors/failure.dart';
import 'package:xlo_flutter/features/ad/data/models/ad_model.dart';
import 'package:xlo_flutter/features/ad/domain/entities/ad_filter_entity.dart';
import 'package:xlo_flutter/features/ad/domain/entities/category_entity.dart';

abstract class GetFilteredAdsDatasource {
  Future<Either<Failure, List<AdModel>>> getFilteredAds({
    required AdFilterEntity filter,
    String? search,
    CategoryEntity? category,
    required int page,
  });
}
